//
//  SayfaA.swift
//  odev4
//
//  Created by Esra Türk on 24.09.2024.
//

import UIKit

class SayfaA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonB(_ sender: Any) {
        performSegue(withIdentifier: "sayfaB", sender: nil)
    }
    
}
