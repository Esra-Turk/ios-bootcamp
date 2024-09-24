//
//  SayfaX.swift
//  odev4
//
//  Created by Esra Türk on 24.09.2024.
//

import UIKit

class SayfaX: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonY(_ sender: Any) {
        performSegue(withIdentifier: "sayfaY", sender: nil)
    }
    
}
