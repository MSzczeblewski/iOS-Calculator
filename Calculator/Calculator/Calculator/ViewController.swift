//
//  ViewController.swift
//  Calculator
//
//  Created by Matthew Szczeblewski on 12/11/15.
//  Copyright © 2015 Matthew Szczeblewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var display: UILabel!
    
    var userIsInMiddleOfTypingNumber: Bool = false
    
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
}

