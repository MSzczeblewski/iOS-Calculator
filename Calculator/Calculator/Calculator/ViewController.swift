//
//  ViewController.swift
//  Calculator
//
//  Created by Matthew Szczeblewski on 12/11/15.
//  Copyright © 2015 Matthew Szczeblewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

/*------------------- Variables -------------------*/
    
    //Display of numbers
    @IBOutlet weak var display: UILabel!
    
    //Boolean to be set if user is in middle of entering a number
    var userIsInMiddleOfTypingNumber: Bool = false
    
    //Stack for storing numbers entered by user
    var operandStack = Array<Double>()
    
    //Constantly updating variable that takes the value of 'display' 
    //Converts it from a optional string to a double
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInMiddleOfTypingNumber = false
        }
    }
    
    
/*------------------- Functions -------------------*/

    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        
        if userIsInMiddleOfTypingNumber{
            enter()
        }
        
        //Calling performOperation function to remove top two values from stack and perform the correct operation
        //The function call is simplified since performOperation accepts a function as input
        switch operation {
            case "+": performOperation {$0 + $1}
            case "−": performOperation {$1 - $0}
            case "×": performOperation {$0 * $1}
            case "÷": performOperation {$1 / $0}
            default: break
        }
        
    }
    
    func performOperation(operatorType: (Double, Double) -> Double ){
        if operandStack.count >= 2{
            displayValue = operatorType(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    

    //Function that appends digits clicked on by user to the 'display' property
    //Generic, recieved an input from the UIButton pressed to get the value
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        print("digit = \(digit)")

        if userIsInMiddleOfTypingNumber{
            display.text = display.text! + digit;
        } else{
            display.text = digit;
            userIsInMiddleOfTypingNumber = true
        }
    }
    

    //Adds value of 'display' to the stack when the return key is pressed
    @IBAction func enter() {
        userIsInMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    

}

   