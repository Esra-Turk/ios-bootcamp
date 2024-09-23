//
//  ViewController.swift
//  ProductDetails
//
//  Created by Esra Türk on 23.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelJacket: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Details"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "AnaRenk")
        
        appearance.titleTextAttributes = [
            .foregroundColor:UIColor(named: "YaziRenk1")!,
            .font:UIFont(name: "Poppins-Light", size: 22)!
        ]
    
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        labelJacket.font = UIFont(name: "Poppins-Light", size: 18)
        labelPrice.font = UIFont(name: "Poppins-Bold", size: 18)
    }


}

