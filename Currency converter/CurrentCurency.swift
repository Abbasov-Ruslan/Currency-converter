//
//  CurrentCurency.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 11.10.2020.
//

import Foundation
import UIKit

struct CurrentCurency {
    var ID: String
    var charCode: String
    var name: String
    var value: Double
    var amount:Double
}

extension CurrentCurency: JSONDecodable {
    init?(JSON: [String : AnyObject]) {
            let dictionary = JSON["USD"] as? [String: AnyObject]
        guard let ID = dictionary?["ID"] as? String,
              let charCode = dictionary!["CharCode"] as? String,
              let name = dictionary!["Name"] as? String,
              let value = dictionary!["Value"] as? Double else {
                return nil
            }
            self.ID = ID
            self.charCode = charCode
            self.name = name
            self.value = value
            self.amount = 0
            
    }
}


extension CurrentCurency {
  var IDString: String {
    return "\(String(ID)) ID"
  }
  
  var charCodeString: String {
    return "\(String(charCode)) charCode"
  }
  
  var nameString: String {
    return "\(String(name)) name"
  }
  
  var valueDouble: Double {
    return Double(value)
  }
}
