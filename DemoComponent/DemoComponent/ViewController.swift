//
//  ViewController.swift
//  DemoComponent
//
//  Created by Do Hung on 7/10/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var calculation = ""
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    var inputNewNumber : Bool = false
   
    @IBOutlet var resultTextfield: UITextField!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttons {
            button.layer.borderColor = view.backgroundColor?.cgColor
            button.layer.borderWidth = 0.5
        }
    }

    @IBAction func clickButton(_ sender: UIButton) {
        if sender.titleLabel?.text == "AC" {
            resultTextfield.text = "0"
        } else if sender.titleLabel?.text == "+/-" {
            if resultTextfield.text != "0" {
                if resultTextfield.text?.first == "-" {
                    resultTextfield.text = String((resultTextfield.text?.characters.dropFirst())!)
                } else {
                    resultTextfield.text = "-\(resultTextfield.text!)"
                }
            }
        } else if sender.titleLabel?.text == "+"
            || sender.titleLabel?.text == "-"
            || sender.titleLabel?.text == "×"
            || sender.titleLabel?.text == "÷" {
            calculation = (sender.titleLabel?.text)!
            firstNumber = Double(resultTextfield.text!)!
            inputNewNumber = true
        } else if sender.titleLabel?.text == "=" {
            secondNumber = Double(resultTextfield.text!)!
            var result : Double = 0
            switch calculation {
            case "+" :
                result = firstNumber + secondNumber
                break
            case "-" :
                result = firstNumber - secondNumber
                break
            case "×" :
                result = firstNumber * secondNumber
                break
            case "÷" :
                result = firstNumber / secondNumber
                break
            default:
                break
            }
            if result == floor(result) {
                resultTextfield.text = String(Int(result))
            } else {
                resultTextfield.text = String(result)
            }
            inputNewNumber = true
        } else {
            if (resultTextfield.text == "0" || inputNewNumber) {
                resultTextfield.text = sender.titleLabel?.text
                inputNewNumber = false
            } else {
                resultTextfield.text = "\(resultTextfield.text!)\(sender.titleLabel!.text!)"
            }
        }
        
    }
    
}

