//
//  ViewController.swift
//  to-do-app
//
//  Created by Esra Türk on 7.10.2024.
//

import UIKit

class Homepage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var toDoList = [ToDos]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
       
        _ = viewModel.toDoList.subscribe(onNext: {liste in
            self.toDoList = liste
            self.toDoTableView.reloadData()
            
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.listele()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detayGecis" {
            if let todo = sender as? ToDos {
                let gidilecekVC = segue.destination as! ToDoDetay
                gidilecekVC.yapilacak = todo
            }
        }
    }
    

}

extension Homepage:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}

extension Homepage:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yapilacakHucre") as! YapilacakHucre
        let yapilacak = toDoList[indexPath.row]
        
        cell.buttonTamamla.tag = indexPath.row
        cell.buttonTamamla.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        cell.yapilacakLabel.text = yapilacak.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = toDoList[indexPath.row]
        performSegue(withIdentifier: "detayGecis", sender: cell)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let todo = toDoList[indexPath.row]
        let alertController = UIAlertController(
            title: "\(todo.name!)",
            message: "Yapılacağı tamamladınız mı? Emin misiniz?",
            preferredStyle: .alert
        )
            
        let evetAction = UIAlertAction(title: "Evet", style: .destructive) { _ in
            self.viewModel.sil(id: todo.id!)
        }
        
        let hayirAction = UIAlertAction(title: "Hayır", style: .cancel, handler: nil)
       
        alertController.addAction(evetAction)
        alertController.addAction(hayirAction)
        
        present(alertController, animated: true, completion: nil)
           
       }
}
