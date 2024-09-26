//
//  ViewController.swift
//  calculator
//
//  Created by Esra Türk on 25.09.2024.
//

import UIKit

class ViewController: UIViewController {
    var currentInput = ""

    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var stackView3: UIStackView!
    @IBOutlet weak var stackView4: UIStackView!
    @IBOutlet weak var stackView5: UIStackView!
    
    @IBOutlet weak var labelOperation: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelOperation.isHidden = true
        labelResult.isHidden = true
        
        addShadowToButtons(in: stackView1)
        addShadowToButtons(in: stackView2)
        addShadowToButtons(in: stackView3)
        addShadowToButtons(in: stackView4)
        addShadowToButtons(in: stackView5)
        
    }
        
    @IBAction func buttonTapped(_ sender: UIButton) {
        let buttonValue = sender.titleLabel?.text
        print("Butona basıldı: \(buttonValue!)")
        
        if checkFirstItem(currenInput: currentInput, buttonValue: buttonValue!){
            return
        }
        
        labelOperation.isHidden = false
        currentInput += buttonValue!
        labelOperation.text = currentInput
            
        if buttonValue == "=" {
            equalButtonTapped(sender)
        } else if buttonValue == "C" {
            clearButtonTapped(sender)
        }
        
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        var numbers: [Double] = []
        var result = 0.0
        let components = labelOperation.text!.components(separatedBy: "+")
        
        print(components)
        labelResult.isHidden = false
        print(labelOperation.text!)
    
        for number in components {
            numbers.append(Double(number)!)
        }
        
        for number in numbers {
            result += number
        }
        
        labelResult.text = "= " + String(result)
        
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        guard currentInput == "" else {
            labelOperation.text = ""
            labelResult.text = ""
            currentInput = ""
            return
        }
       
    }
    
    func checkFirstItem(currenInput:String, buttonValue: String) -> Bool{
        if currentInput == "" && (buttonValue == "+" || buttonValue == ".") {
            let alertController = UIAlertController(title: "Geçersiz İşlem", message: "Sayı tuşlayınız", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "iptal", style: .cancel)
            let tamamAction = UIAlertAction(title: "Tamam", style: .destructive)
            
            alertController.addAction(iptalAction)
            alertController.addAction(tamamAction)
            
            self.present(alertController, animated: true)
            
            return true
        } else {
            return false
        }
    }
    
    func addShadowToButtons(in stackView: UIStackView) {
        for view in stackView.arrangedSubviews {
            if let button = view as? UIButton {
                addShadowToButton(button: button)
            }
        }
    }
    
    func addShadowToButton(button: UIButton) {
        button.layer.cornerRadius = 10
            button.layer.shadowColor = UIColor.gray.cgColor
            button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            button.layer.shadowRadius = 4.0
            button.layer.shadowOpacity = 0.3
            button.layer.masksToBounds = false
            button.clipsToBounds = false
    }

}
