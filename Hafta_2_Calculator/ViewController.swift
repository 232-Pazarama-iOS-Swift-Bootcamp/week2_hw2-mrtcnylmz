//
//  ViewController.swift
//  Hafta_2_Calculator
//
//  Created by Mertcan Yılmaz on 2.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    
    var baseNumber : Double = 0
    var isCalculated = false
    var isDotted = false
    var lastOperation : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapDigitButton(_ sender: UIButton) {
        if isCalculated {
            displayLabel.text! = String(Int(sender.currentTitle!)!)
            baseNumber = 0;
            isCalculated = false
        }else{
            if displayLabel.text! == "0" {
                displayLabel.text! = String(Int(sender.currentTitle!)!)
            }else{
                displayLabel.text! += String(Int(sender.currentTitle!)!)
            }
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        displayLabel.text! = "0"
        baseNumber = 0;
        isCalculated = false
        isDotted = false
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard isDotted || isCalculated else {
            isDotted = true
            return displayLabel.text! += "."
        }
    }
    
    @IBAction func sciOperationsButtonTapped(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "X²":
            baseNumber = Double(displayLabel.text!)!
            displayLabel.text! = String(baseNumber * baseNumber)
            historyLabel.text! = displayLabel.text!
            isCalculated = true
        case "x³":
            baseNumber = Double(displayLabel.text!)!
            displayLabel.text! = String(baseNumber * baseNumber * baseNumber)
            historyLabel.text! = displayLabel.text!
            isCalculated = true
        case "√x":
            baseNumber = Double(displayLabel.text!)!
            displayLabel.text! = String(baseNumber.squareRoot())
            historyLabel.text! = displayLabel.text!
            isCalculated = true
        default:
            break
        }
    }
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        if baseNumber == 0{
            baseNumber = Double(displayLabel.text!)!
            displayLabel.text! = "0"
            isCalculated = false
            isDotted = false
            lastOperation = String(sender.currentTitle!)
        }else{
            switch sender.currentTitle! {
            case "*":
                baseNumber *= Double(displayLabel.text!)!
                displayLabel.text! = "0"
                isCalculated = false
                isDotted = false
                lastOperation = "*"
            case "/":
                baseNumber /= Double(displayLabel.text!)!
                displayLabel.text! = "0"
                isCalculated = false
                isDotted = false
                lastOperation = "/"
            case "-":
                baseNumber = baseNumber - Double(displayLabel.text!)!
                displayLabel.text! = "0"
                isCalculated = false
                isDotted = false
                lastOperation = "-"
            case "+":
                baseNumber += Double(displayLabel.text!)!
                displayLabel.text! = "0"
                isCalculated = false
                isDotted = false
                lastOperation = "+"
            default:
                break
            }
        }
    }
    
    @IBAction func finalizeButtonTapped(_ sender: UIButton) {
        if let operation : String = lastOperation{
            switch operation {
            case "*":
                baseNumber *= Double(displayLabel.text!)!
            case "/":
                baseNumber /= Double(displayLabel.text!)!
            case "-":
                baseNumber = baseNumber - Double(displayLabel.text!)!
            case "+":
                baseNumber += Double(displayLabel.text!)!
                
            default:
                break
            }
        }
        displayLabel.text! = String(baseNumber)
        historyLabel.text! = displayLabel.text!
        isCalculated = true
    }
}
