//
//  ViewController.swift
//  odev-4
//
//  Created by Esra Türk on 25.09.2024.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonA(_ sender: Any) {
        performSegue(withIdentifier: "sayfaA", sender: nil)
    }
    
    @IBAction func buttonX(_ sender: Any) {
        performSegue(withIdentifier: "sayfaX", sender: nil)
    }
}

