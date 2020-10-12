//
//  APICurrencyManager.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 10.10.2020.
//

import Foundation

enum CurrencyType: FinalURLPoint {
    
//    case Current(apiKey: String, currencyId: String)
    
    case Current(Void)
    
    var baseURL: URL {
        return URL(string: "https://www.cbr-xml-daily.ru")!
    }
    
    var path: String {
        switch self {
//        case .Current(let apiKey, let currencyId):
        case .Current():
            return "/daily_json.js"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        return URLRequest(url: url!)
    }
}


final class APICurrencyManager: APIManager {

    var sessionConfiguration: URLSessionConfiguration
    
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    } ()
    
//    let apiKey: String
    
//    init(sessionConfiguration: URLSessionConfiguration, apiKey: String) {
    init(sessionConfiguration: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfiguration
//        self.apiKey = apiKey
    }
    
//    convenience init(apiKey: String) {
        convenience init() {
//        self.init(sessionConfiguration: URLSessionConfiguration.default, apiKey: apiKey)
          self.init(sessionConfiguration: URLSessionConfiguration.default)
    }
    
//    func fetchCurrentCurrencyWith(currencyId: String, complitionHandler: @escaping (APIResult<CurrentCurency>) -> Void ) {
    func fetchCurrentCurrencyWith(complitionHandler: @escaping (APIResult<CurrentCurency>) -> Void ) {
//        let request = CurrencyType.Current(apiKey: self.apiKey, currencyId: currencyId).request
        let request = CurrencyType.Current(()).request
        fetch(request: request, parse: { (json) -> CurrentCurency? in
            if let dictionary = json["Valute"] as? [String: AnyObject] {
                return CurrentCurency(JSON: dictionary)
            } else {
                return nil
            }
        }, complitionHandler: complitionHandler)
    }
}
