//
//  CurrentDictionary.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 11.10.2020.
//

import Foundation
import UIKit

struct CurrentDictionary {
    var ID: String
    var charCode: String
    var name: String
    var value: Double
    var amount:Double
    
    
    init?(currentCurency:CurrentCurency, charCode:String) {
        let dictionary = currentCurency.dictionary
        let localdictionary = dictionary[charCode]
        guard let ID = localdictionary?["ID"] as? String,
              let charCode = localdictionary?["CharCode"] as? String,
              let name = localdictionary?["Name"] as? String,
              let value = localdictionary?["Value"] as? Double else {
            return nil
        }
        
        self.ID = ID
        self.charCode = charCode
        self.name = name
        self.value = value
        self.amount = 0
        
        
        func returnCharcode () -> String {
            return charCode
        }
        
        func returnValue() -> Double {
            return value
        }
        
    }
}

