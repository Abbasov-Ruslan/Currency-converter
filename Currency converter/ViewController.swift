//
//  ViewController.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 09.10.2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var CurencyLabel: UILabel!
    
    
        lazy var currencyManager = APICurrencyManager(apiKey: "2341234")
        
    
    
    override func viewDidLoad() {
        currencyManager.fetchCurrentCurrencyWith(currencyId: "R01020A") { (result) in
            switch result {
            case .Succes(let currentCurency):
                self.updateUIWith(CurrentCurency: currentCurency)
            case .Failure(let error as NSError):
                let alertController = UIAlertController(title: "Unable to get data", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                self.present(alertController, animated: true, completion: nil)
            default: break
            }
            
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func updateUIWith(CurrentCurency: CurrentCurency) {
      
        let text = String(CurrentCurency.value)
        
        self.CurencyLabel.text = text

    }
    
    
}

