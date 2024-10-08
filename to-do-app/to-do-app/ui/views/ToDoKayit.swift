//
//  ToDoKayit.swift
//  to-do-app
//
//  Created by Esra Türk on 7.10.2024.
//

import UIKit

class ToDoKayit: UIViewController {

    @IBOutlet weak var tfYapilacak: UITextField!
    
    var viewModel = KayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func buttonEkle(_ sender: Any) {
        if let name = tfYapilacak.text{
            viewModel.kaydet(name: name)
        }
        
    }
    
}
