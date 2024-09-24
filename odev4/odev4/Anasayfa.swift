//
//  ViewController.swift
//  odev4
//
//  Created by Esra Türk on 24.09.2024.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonA(_ sender: Any) {
        performSegue(withIdentifier: "sayfaA", sender: nil)
    }
    
    @IBAction func buttonX(_ sender: Any) {
        performSegue(withIdentifier: "sayfaX", sender: nil)
    }
}

