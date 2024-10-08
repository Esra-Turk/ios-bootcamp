//
//  KayitViewModel.swift
//  to-do-app
//
//  Created by Esra Türk on 7.10.2024.
//

import Foundation

class KayitViewModel {
    
    var tdRepo = ToDosRepository()
    
    func kaydet(name:String) {
        tdRepo.kaydet(name: name)
        
    }
    
}
