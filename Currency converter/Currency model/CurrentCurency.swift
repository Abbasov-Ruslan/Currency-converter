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
        let dictionary = JSON as [String: AnyObject]
        self.dictionary = dictionary
        
    }
}

extension CurrentCurency {
    var returnDictionary:[String: AnyObject] {
        return (dictionary)
    }
}
