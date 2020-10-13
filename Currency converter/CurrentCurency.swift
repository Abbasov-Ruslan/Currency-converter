//
//  CurrentCurency.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 11.10.2020.
//

import Foundation
import UIKit

struct CurrentCurency {
    var dictionary: [String: AnyObject]
}

extension CurrentCurency: JSONDecodable {
    init?(JSON: [String : AnyObject]) {
        guard let dictionary = JSON["USD"] as? [String: AnyObject] else {
            return nil
        }
        self.dictionary = dictionary
        
    }
}


extension CurrentCurency {
    var returnDictionary:[String: AnyObject] {
        return (dictionary)
    }
}
