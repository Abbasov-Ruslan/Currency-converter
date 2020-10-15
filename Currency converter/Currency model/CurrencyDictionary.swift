import Foundation
import UIKit

struct CurrentDictionary {
    var ID: String
    var charCode: String
    var name: String
    var value: Double
    
    
    init?(currentCurency:CurrentCurency, charCode:String) {
        if charCode == "RUB" {
            let rubID = "1B946"
            let rubCharCode = "RUB"
            let rubName = "Russian Ruble"
            let rubValue = 1.0
            
            self.ID = rubID
            self.charCode = rubCharCode
            self.name = rubName
            self.value = rubValue
        } else {
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
        }
    }
    
}

