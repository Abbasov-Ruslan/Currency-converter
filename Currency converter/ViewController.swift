//
//  ViewController.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 09.10.2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var LeftChangeCurrencyButton: UIButton!
    @IBOutlet weak var rightChangeCurrencyButton: UIButton!
    @IBOutlet weak var switchNumbersButton: UIButton!
    @IBOutlet weak var leftCharCodeLabel: UILabel!
    @IBOutlet weak var rightCharCodeLabel: UILabel!
    @IBOutlet weak var leftNumberField: UITextField!{
        didSet{
            leftNumberField.text = "0"
        }
    }
    
    lazy var currencyManager = APICurrencyManager()
    var amountOfMoney = MoneyAmount()
    var leftController = Controller()
    var rightController = Controller()
    
    @IBOutlet weak var rightNumberField: UITextField!
    
    
    
    @IBAction func leftAmountChanged(_ sender: Any) {
        let num = leftController.getCurrencyValue()
        amountOfMoney.leftMoneyAmount = Double(leftNumberField.text ?? "0") ?? 0
        rightNumberField.text = String((num * amountOfMoney.leftMoneyAmount * 1000).rounded() / 1000)
        
    }
    
    @IBAction func unwindToMainScreen(seque: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftController.getData(charCode: "USD")
        let leftNum = leftController.getCurrencyValue()
        leftNumberField.text = String(leftNum)
        rightController.getData(charCode: "RUB")
        let rightNum = rightController.getCurrencyValue()
        rightNumberField.text = String(rightNum)
        }
    
    

    
}

