//
//  Controller.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 13.10.2020.
//

import Foundation
class Controller {
    lazy var currencyManager = APICurrencyManager()
    var AmountOfMoney = MoneyAmount()
    var value: Double = 0
    
    init() {}
    
    
    func getData (charCode:String) {
        currencyManager.fetchCurrentCurrencyWith() { [](result) in
            switch result {
            case .Succes(let currentCurency):
                let currency = CurrentDictionary(currentCurency: currentCurency, charCode: charCode)
                self.value = currency?.value ?? 0
            case .Failure( _ as NSError):
                break
            default:
                break
            }
            
        }
    }
    
    func getCurrencyValue() -> Double{
        return self.value
    }
    
}


