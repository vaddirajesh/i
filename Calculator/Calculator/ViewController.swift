//
//  ViewController.swift
//  Calculator
//
//  Created by Rajesh Vaddi on 7/30/16.
//  Copyright © 2016 iSol.tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak private var display: UILabel!
    private var userInMiddleOfTyping = false
    
    @IBAction private func digitTouched(_ sender: UIButton) {
        let digitValue = sender.currentTitle!
        if userInMiddleOfTyping {
        let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay+digitValue}
        else{
            display.text = digitValue
        }
        userInMiddleOfTyping = true
    }
    
    private var displayValue :Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userInMiddleOfTyping{
            brain.setOperand(displayValue)
            userInMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
           brain.performOperation(mathematicalSymbol)
        }
        displayValue=brain.result
    }
    
    
}

