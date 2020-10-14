//
//  CurrencyList.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 13.10.2020.
//

import UIKit



class CurrencyList: UITableViewController {
    
    var leftCurrency:Bool = false
    
    
    let currencyArray = ["Рубль                                        RUB",
                         "Австралийский доллар        AUD",
                         "Бразильский реал                 BRL",
                         "Евро                                          EUR",
                         "Доллар                                     USD"
    ]
    
    let charCodeArray = ["RUB",
                         "AUD",
                         "BRL",
                         "EUR",
                         "USD"
    ]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        
        cell.backgroundColor = UIColor.init(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        
        cell.textLabel?.text = currencyArray[indexPath.row]
        cell.textLabel?.numberOfLines = 1
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }    
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let viewController = segue.destination as! ViewController
                
//                viewController.rightController.getData(charCode: viewController.rightCharCode)
//                viewController.leftController.getData(charCode: viewController.leftCharCode)
//
//                let rightCurencyValue = viewController.rightController.getCurrencyValue()
//                let leftCurencyValue = viewController.leftController.getCurrencyValue()
                
                if leftCurrency{
                    viewController.leftCharCodeLabel.text = charCodeArray[indexPath.row]
                    viewController.leftCharCode = charCodeArray[indexPath.row]
                    viewController.leftCurrency = true
                    
                    viewController.rightController.getData(charCode: viewController.rightCharCode)
                    viewController.leftController.getData(charCode: viewController.leftCharCode)

//                    let rightCurencyValue = viewController.rightController.getCurrencyValue()
//                    let leftCurencyValue = viewController.leftController.getCurrencyValue()
                    
//                    viewController.amountOfMoney.leftMoneyAmount = Double(viewController.leftNumberField.text ?? "0") ?? 0
//                    let roundedValue = String(( viewController.amountOfMoney.leftMoneyAmount * leftCurencyValue / rightCurencyValue * 100).rounded(.toNearestOrEven) / 100)
//                    viewController.rightNumberField.text = String(roundedValue)
                    
                    
                } else {
                    viewController.rightCharCodeLabel.text = charCodeArray[indexPath.row]
                    viewController.rightCharCode = charCodeArray[indexPath.row]
                    viewController.leftCurrency = false
                    
                    viewController.rightController.getData(charCode: viewController.rightCharCode)
                    viewController.leftController.getData(charCode: viewController.leftCharCode)

//                    let rightCurencyValue = viewController.rightController.getCurrencyValue()
//                    let leftCurencyValue = viewController.leftController.getCurrencyValue()
                    
//                    viewController.amountOfMoney.rightMoneyAmount = Double(viewController.rightNumberField.text ?? "0") ?? 0
//                    let roundedValue = String(( viewController.amountOfMoney.rightMoneyAmount * rightCurencyValue / leftCurencyValue * 100).rounded(.toNearestOrEven) / 100)
//                    viewController.leftNumberField.text = String(roundedValue)
                    
                }
            }
    }
    
}
