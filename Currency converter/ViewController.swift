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
    var AmountOfMoney = MoneyAmount()
    var controller = Controller()
    
    @IBOutlet weak var rightNumberField: UITextField!
    
    
    
    @IBAction func leftAmountChanged(_ sender: Any) {
        AmountOfMoney.leftMoneyAmount = Double(leftNumberField.text ?? "0") ?? 0
    }
    
    @IBAction func unwindToMainScreen(seque: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.getData(charCode: "Value")
        var num = controller.getCurrencyValue()
        leftNumberField.text = String(num)
        }
    
    

    
}

