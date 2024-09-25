//
//  SayfaX.swift
//  odev-4
//
//  Created by Esra Türk on 25.09.2024.
//

import UIKit

class SayfaX: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonY(_ sender: Any) {
        performSegue(withIdentifier: "sayfaY", sender: nil)
    }
    
}
