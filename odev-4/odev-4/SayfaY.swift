//
//  sayfaY.swift
//  odev-4
//
//  Created by Esra Türk on 25.09.2024.
//

import UIKit

class SayfaY: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonGeri(_ sender: Any) {
        if let rootViewController = self.view.window?.rootViewController {
               rootViewController.dismiss(animated: true, completion: nil)
           }
    }
    
    
}
