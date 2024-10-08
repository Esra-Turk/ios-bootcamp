//
//  DetayViewModel.swift
//  to-do-app
//
//  Created by Esra Türk on 7.10.2024.
//

import Foundation

class DetayViewModel {
    
    var tdRepo = ToDosRepository()
    
    func guncelle(id:Int,name:String) {
        tdRepo.guncelle(id: id, name: name)
    }
    
}
