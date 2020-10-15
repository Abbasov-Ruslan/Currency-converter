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
    
    // MARK: - Public Properties
    
    lazy var currencyManager = APICurrencyManager()
    var amountOfMoney = MoneyAmount()
    var leftController = Controller()
    var rightController = Controller()
    var leftCharCode = "USD"
    var rightCharCode = "RUB"
    var leftCurrency:Bool? = nil
    
    // MARK: - Lifecycle
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        removeKeyboard()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFiledsDelegate()
        getContollersData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getContollersData()
        
        let leftCurencyValue = leftController.getCurrencyValue()
        let rightCurencyValue = rightController.getCurrencyValue()
        
        //Checking if LeftChangeCurrencyButton or rightChangeCurrencyButton was touched
        if leftCurrency != nil {
            //checking is it left or right button
            if leftCurrency == false {
                setRightMoneyAmount()
                let roundedValueString = getRightFinalConvertion(rightCurencyValue: rightCurencyValue, leftCurencyValue: leftCurencyValue)
                setLefttNumberField(text: roundedValueString)
            }
            if leftCurrency == true {
                setLeftMoneyAmount()
                let roundedValueString = getLeftFinalConvertion(rightCurencyValue: rightCurencyValue, leftCurencyValue: leftCurencyValue)
                setRightNumberField(text: roundedValueString)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currencyList = segue.destination as! CurrencyList
        if segue.identifier == "leftButtonSeque"{
            //set property for side of button
            currencyList.leftCurrency = true
            leftCurrency = true
        } else {
            currencyList.leftCurrency = false
            leftCurrency = false
        }
    }
    
    // MARK: - Private Methods
    
    private func removeKeyboard() {
        self.view.endEditing(true)
    }
    
    private func textFiledsDelegate() {
        rightNumberField.delegate = self
        leftNumberField.delegate = self
    }
    
    private func getContollersData() {
        leftController.getData(charCode: leftCharCode)
        rightController.getData(charCode: rightCharCode)
    }
    
    private func setRightMoneyAmount() {
        amountOfMoney.rightMoneyAmount = Double(rightNumberField.text ?? "0") ?? 0
    }
    
    private func setLeftMoneyAmount() {
        amountOfMoney.leftMoneyAmount = Double(leftNumberField.text ?? "0") ?? 0
    }
    
    private func getRightFinalConvertion (rightCurencyValue:Double,leftCurencyValue:Double ) -> String {
        return String(( amountOfMoney.rightMoneyAmount * rightCurencyValue / leftCurencyValue * 100).rounded(.toNearestOrEven) / 100)
    }
    
    private func getLeftFinalConvertion (rightCurencyValue:Double,leftCurencyValue:Double ) -> String {
        return  String(( amountOfMoney.leftMoneyAmount * leftCurencyValue / rightCurencyValue * 100).rounded(.toNearestOrEven) / 100)
    }
    
    private func setRightNumberField(text:String) {
        rightNumberField.text = String(text)
    }
    
    private func setLefttNumberField(text:String) {
        leftNumberField.text = String(text)
    }
    
    // MARK: - IBActions
    
    @IBAction func rightTextFieldChanged(_ sender: Any) {
        let rightCurencyValue = rightController.getCurrencyValue()
        let leftCurencyValue = leftController.getCurrencyValue()
        setRightMoneyAmount()
        let roundedValueString = getRightFinalConvertion(rightCurencyValue: rightCurencyValue, leftCurencyValue: leftCurencyValue)
        setLefttNumberField(text: roundedValueString)
        removeKeyboard()
    }
    
    @IBAction func leftTextFieldChanged(_ sender: Any) {
        let rightCurencyValue = rightController.getCurrencyValue()
        let leftCurencyValue = leftController.getCurrencyValue()
        setLeftMoneyAmount()
        let roundedValueString = getLeftFinalConvertion(rightCurencyValue: rightCurencyValue, leftCurencyValue: leftCurencyValue)
        setRightNumberField(text: roundedValueString)
        removeKeyboard()
    }
    
    @IBAction func unwindToMainScreen(seque: UIStoryboardSegue) {
        getContollersData()
    }
    
}



