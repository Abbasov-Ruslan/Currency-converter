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
    
    
    @IBOutlet weak var rightNumberField: UITextField!
    
    
    
    @IBAction func leftAmountChanged(_ sender: Any) {
        AmountOfMoney.leftMoneyAmount = Double(leftNumberField.text ?? "0") ?? 0
        getData()
    }
    
    @IBAction func unwindToMainScreen(seque: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        }
    
    
    func getData() {
        currencyManager.fetchCurrentCurrencyWith() { [self] (result) in
            switch result {
            case .Succes(let currentCurency):
                self.updateUIWith(CurrentCurency: currentCurency)
                self.updateRightTextField(CurrentCurency: currentCurency, moneyAmount: AmountOfMoney)
            case .Failure(let error as NSError):
                let alertController = UIAlertController(title: "Unable to get data", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    
    func updateUIWith(CurrentCurency: CurrentCurency) {
//        let currentCurrencyValue = CurrentCurency.value
//        let leftNumber = Mon
//        let result = leftNumber * currentCurrencyValue
//        self.rightNumberField.text = String(result)
//        textFieldChanged(leftNumberField)
        
    }
    
    func updateRightTextField(CurrentCurency: CurrentCurency,moneyAmount:MoneyAmount) {
        let currentCurrencyValue = CurrentCurency.value
        let leftNumber = moneyAmount.leftMoneyAmount
        let result = leftNumber * currentCurrencyValue
        self.rightNumberField.text = String(result)
    }
    
}

