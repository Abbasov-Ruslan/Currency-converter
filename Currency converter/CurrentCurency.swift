//
//  CurrentCurency.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 11.10.2020.
//

import Foundation
import UIKit

struct CurrentCurency {
    let ID: String
    let charCode: String
    let name: String
    let value: Double
}

extension CurrentCurency: JSONDecodable {
    init?(JSON: [String : AnyObject]) {
        guard let ID = JSON["ID"] as? String,
        let charCode = JSON["CharCode"] as? String,
        let name = JSON["Name"] as? String,
        let value = JSON["Value"] as? Double else {
            return nil
        }
        
        self.ID = ID
        self.charCode = charCode
        self.name = name
        self.value = value
        
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
  
  var appearentTemperatureString: String {
    return "\(Double(value))value"
  }
}
