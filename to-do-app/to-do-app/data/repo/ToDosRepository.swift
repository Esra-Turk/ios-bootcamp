//
//  toDosRepository.swift
//  to-do-app
//
//  Created by Esra Türk on 7.10.2024.
//

import Foundation
import RxSwift

class ToDosRepository {
    var toDoList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDos.db")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func listele() {
        db?.open()
        
        do {
            var liste = [ToDos]()
            let rs = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            
            while rs.next() {
                let id = Int(rs.string(forColumn: "id"))
                let name = rs.string(forColumn: "name")
                
                let todo = ToDos(id: id!, name: name!)
                liste.append(todo)
                
            }

            toDoList.onNext(liste) // tetikleme
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi:String) {
        db?.open()
        
        do {
            var liste = [ToDos]()
            let rs = try db!.executeQuery("SELECT * FROM toDos WHERE name LIKE '%\(aramaKelimesi)%'", values: nil)
            
            while rs.next() {
                let id = Int(rs.string(forColumn: "id"))
                let name = rs.string(forColumn: "name")
                
                let todo = ToDos(id: id!, name: name!)
                liste.append(todo)
                
            }

            toDoList.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kaydet(name:String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO toDos (name) VALUES (?)", values:[name])
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(id:Int){
        db?.open()
            
        do {
            try db!.executeUpdate("DELETE FROM toDos WHERE id = ?", values:[id])
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
    func guncelle(id:Int, name:String){
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE toDos SET name = ? WHERE id = ?", values:[name,id])
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
}
