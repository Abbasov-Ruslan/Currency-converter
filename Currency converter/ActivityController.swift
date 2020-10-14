//
//  ActivityController.swift
//  Currency converter
//
//  Created by Ruslan Abbasov on 13.10.2020.
//

import UIKit


class ActivityViewController: UIViewController {
    
    @IBOutlet weak var toggleActivityIndicator: UIActivityIndicatorView!
    
    func toggleActivityIndicator(on:Bool) {
        if on {
            toggleActivityIndicator.startAnimating()
        } else {
            toggleActivityIndicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        toggleActivityIndicator(on: true)
        toggleActivityIndicator(on: false)
        self.performSegue(withIdentifier: "firstSeque", sender: nil)
    }
    
    
}
