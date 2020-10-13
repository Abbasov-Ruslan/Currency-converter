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

    
    init() {}
    
    
    func getData() -> CurrentCurency {
        var localCurrecy = CurrentCurency(ID: "", charCode: "", name: "", value: 0, amount: 0)
        currencyManager.fetchCurrentCurrencyWith() { (result) in
            switch result {
            case .Succes(let currentCurency):
                localCurrecy = currentCurency
            case .Failure( _ as NSError):
                break
            default:
                break
            }
        }
        return localCurrecy
    }
    
    
}
