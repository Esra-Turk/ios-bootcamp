//
//  SayfaA.swift
//  odev-4
//
//  Created by Esra Türk on 25.09.2024.
//

import UIKit

class SayfaA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonB(_ sender: Any) {
        performSegue(withIdentifier: "sayfaB", sender: nil)
    }
    
}
