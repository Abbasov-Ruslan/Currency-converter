//
//  APIManager.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 10.10.2020.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONComlitionHandler = ([String: AnyObject]?, HTTPURLResponse?,Error?) -> Void

protocol JSONDecodable {
  init?(JSON: [String: AnyObject])
}

protocol FinalURLPoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
}


enum APIResult<T>{
    case Succes(T)
    case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration {get}
    var session: URLSession {get}
    
    //func JSONTaskWith(request: URLSession, complitionHandler:@escaping JSONComlitionHandler) -> JSONTask
    //func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, complitionHandler:  APIResult<T>) -> Void
    
}

extension APIManager {
    func JSONTaskWith(request: URLRequest, completeHandler:@escaping JSONComlitionHandler) -> JSONTask{
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
        
            guard let HTTPResponse = response as? HTTPURLResponse else {
                
                let userInfo = [
                    NSLocalizedDescriptionKey:NSLocalizedString("Missing HTTP Response", comment: "")
                ]
                let error = NSError(domain: CCNetworkingErrorDomain, code: 100, userInfo: userInfo)
                
                completeHandler(nil, nil, error)
                return
            }
            
            if data == nil{
                if let error = error {
                    completeHandler(nil, HTTPResponse, error)
                }
            } else {
                switch HTTPResponse.statusCode {
                case 200:
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                        completeHandler(json, HTTPResponse, nil)
                    } catch let error as NSError {
                     completeHandler(nil, HTTPResponse, error)
                    }
                default:
                    print("We have got response status \(HTTPResponse.statusCode)")
                }
            }
        }
        return dataTask
    }
    
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, comlitionHandler: @escaping
                    (APIResult<T>) -> Void) {
        
        let dataTask = JSONTaskWith(request: request) { (json, response, error) in
            
            DispatchQueue.main.async(execute: {
                guard let json = json else {
                    if let error = error {
                    }
                    return
                }
                
                if let value = parse(json) {
                    comlitionHandler(.Succes(value))
                } else {
                    let error = NSError(domain: CCNetworkingErrorDomain, code: 200, userInfo: nil)
                }
            })
        }
        dataTask.resume()
    }
}
