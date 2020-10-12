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
    @IBOutlet weak var leftNumberField: UITextField!
    @IBOutlet weak var rightNumberField: UITextField!
    
    
    
    
    lazy var currencyManager = APICurrencyManager()

    
    
    override func viewDidLoad() {
            currencyManager.fetchCurrentCurrencyWith() { (result) in
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
        
        
        print(text)

    }
    
    
}

