//
//  AnasayfaViewModel.swift
//  to-do-app
//
//  Created by Esra Türk on 7.10.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())

    var tdRepo = ToDosRepository()
    
    init() {
        veritabaniKopyala()
        listele()
        toDoList = tdRepo.toDoList
    }
    
    func listele(){
        tdRepo.listele()
        
    }
    
    func ara(aramaKelimesi:String){
        tdRepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(id:Int){
        tdRepo.sil(id: id)
        listele()
    }
    
    
    func veritabaniKopyala(){
            let bundleYolu = Bundle.main.path(forResource: "toDos", ofType: ".db")
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDos.db")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: kopyalanacakYer.path){
                print("Veritabanı zaten var")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                }catch{}
            }
    }
    
}
