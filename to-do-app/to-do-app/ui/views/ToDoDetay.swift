//
//  ToDoDetay.swift
//  to-do-app
//
//  Created by Esra Türk on 7.10.2024.
//

import UIKit

class ToDoDetay: UIViewController {
    var yapilacak: ToDos?

    @IBOutlet weak var tfYapilacak: UITextField!
    
    var viewModel = DetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let todo = yapilacak {
            tfYapilacak.text = todo.name
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let todo = yapilacak, let name = tfYapilacak.text {
            viewModel.guncelle(id: todo.id!, name: name)
        }
        
    }
}
