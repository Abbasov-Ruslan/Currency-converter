import Foundation

enum CurrencyType: FinalURLPoint {
    
    case Current(Void)
    
    var baseURL: URL {
        return URL(string: "https://www.cbr-xml-daily.ru")!
    }
    
    var path: String {
        switch self {
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
    
    
    
    
    init(sessionConfiguration: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    
    convenience init() {
        self.init(sessionConfiguration: URLSessionConfiguration.default)
    }
    
    
    func fetchCurrentCurrencyWith(complitionHandler: @escaping (APIResult<CurrentCurency>) -> Void ) {
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
