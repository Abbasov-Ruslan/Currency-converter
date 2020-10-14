//
//  ViewController.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 09.10.2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,UITextFieldDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var LeftChangeCurrencyButton: UIButton!
    @IBOutlet weak var rightChangeCurrencyButton: UIButton!
    @IBOutlet weak var switchNumbersButton: UIButton!
    @IBOutlet weak var leftCharCodeLabel: UILabel!
    @IBOutlet weak var rightCharCodeLabel: UILabel!
    @IBOutlet weak var rightNumberField: UITextField!
    @IBOutlet weak var leftNumberField: UITextField!
    
    lazy var currencyManager = APICurrencyManager()
    var amountOfMoney = MoneyAmount()
    var leftController = Controller()
    var rightController = Controller()
    var leftCharCode = "USD"
    var rightCharCode = "RUB"

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
//    @IBAction func rightTextFieldEditingBegin(_ sender: Any) {
////        rightNumberField.becomeFirstResponder()
//        rightNumberField.selectAll(nil)
//    }
//
//    @IBAction func leftTextFieldEditingBegin(_ sender: Any) {
////        leftNumberField.becomeFirstResponder()
//        leftNumberField.selectAll(nil)
//    }
    
    

    
    
    @IBAction func rightTextFieldChanged(_ sender: Any) {
        let rightCurencyValue = rightController.getCurrencyValue()
        let leftCurencyValue = leftController.getCurrencyValue()
        amountOfMoney.rightMoneyAmount = Double(rightNumberField.text ?? "0") ?? 0
        let roundedValue = String(( amountOfMoney.rightMoneyAmount * rightCurencyValue / leftCurencyValue * 100).rounded(.toNearestOrEven) / 100)
        leftNumberField.text = String(roundedValue)
        self.view.endEditing(true)
    }
    
    @IBAction func leftTextFieldChanged(_ sender: Any) {
        let rightCurencyValue = rightController.getCurrencyValue()
        let leftCurencyValue = leftController.getCurrencyValue()
        amountOfMoney.leftMoneyAmount = Double(leftNumberField.text ?? "0") ?? 0
        let roundedValue = String(( amountOfMoney.leftMoneyAmount * leftCurencyValue / rightCurencyValue * 100).rounded(.toNearestOrEven) / 100)
        rightNumberField.text = String(roundedValue)
        self.view.endEditing(true)
    }
    

    
    @IBAction func unwindToMainScreen(seque: UIStoryboardSegue) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftController.getData(charCode: leftCharCode)
        rightController.getData(charCode: rightCharCode)
        rightNumberField.delegate = self
        leftNumberField.delegate = self
        }
    
     override func viewDidAppear(_ animated: Bool) {
        leftController.getData(charCode: leftCharCode)
        rightController.getData(charCode: rightCharCode)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currencyList = segue.destination as! CurrencyList
        if segue.identifier == "leftButtonSeque"{
            currencyList.leftCurrency = true
        } else {            
            currencyList.leftCurrency = false
        }
    }
    
    
}
    
    
    

