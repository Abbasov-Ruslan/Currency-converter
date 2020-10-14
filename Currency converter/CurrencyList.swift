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
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
            let viewController = segue.destination as! ViewController
            
            if leftCurrency{
                viewController.leftCharCodeLabel.text = charCodeArray[indexPath.row]
                viewController.leftCharCode = charCodeArray[indexPath.row]
                viewController.leftCurrency = true
                
                viewController.rightController.getData(charCode: viewController.rightCharCode)
                viewController.leftController.getData(charCode: viewController.leftCharCode)
                
            } else {
                viewController.rightCharCodeLabel.text = charCodeArray[indexPath.row]
                viewController.rightCharCode = charCodeArray[indexPath.row]
                viewController.leftCurrency = false
                
                viewController.rightController.getData(charCode: viewController.rightCharCode)
                viewController.leftController.getData(charCode: viewController.leftCharCode)
                
            }
        }
    }
    
}
