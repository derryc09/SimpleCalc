//
//  ViewController.swift
//  SimpleCalcIOS
//
//  Created by Andrew Yu on 10/22/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var theDisplay: UILabel!
    var firstNumber = Double()
    var secondNumber = Double()
    var isTyping = false
    var result = Double()
    var operation = ""
    var count = 0.0
    var total = Double()
    var decimalCount = 0;
    
    @IBAction func number(sender: AnyObject) {
        let number = sender.currentTitle
        if(number == "."){
            decimalCount++
        }
        if(decimalCount>1){
            theDisplay.text! = "ERROR!Bad!"
        } else {
            if (isTyping == false){
                theDisplay.text = number
                isTyping = true
            } else {
                theDisplay.text = theDisplay.text! +  number!!
            }
        }
    }
    
    @IBAction func Operation(sender: AnyObject) {
        isTyping = false
        decimalCount = 0
        operation = sender.currentTitle!!
        if(operation == "Fact"){
            firstNumber = Double(theDisplay.text!)!
            result = 1
            for(var i = firstNumber; i > 0.0; i--){
                result *= i
            }
            if(result % 1 == 0){
                theDisplay.text = "\(Int(result))"
            } else {
                theDisplay.text = "\(result)"
            }
            restart()
        } else if (operation == "Avg" || operation == "Count"){
            firstNumber = Double(theDisplay.text!)!
            total += firstNumber
            count++
        } else {
            firstNumber = Double(theDisplay.text!)!
        }
    }

    // 2 + 3 + 4 * 5 = 45

//    func tempEquals (){
//        secondNumber = Double(theDisplay.text!)!
//        var temp = Double()
//        if(operation == "+"){
//            temp = firstNumber + secondNumber
//        } else if(operation == "-"){
//            temp = firstNumber - secondNumber
//        } else if(operation == "x"){
//            temp = firstNumber * secondNumber
//        } else if(operation == "/"){
//            temp = firstNumber / secondNumber
//        } else if(operation == "%"){
//            temp = firstNumber % secondNumber
//        }
//        firstNumber = temp
//        
//        if(temp % 1 == 0){
//            theDisplay.text! = "\(Int(temp))"
//        } else {
//            theDisplay.text! = "\(temp)"
//        }
//    }
//    
    
    @IBAction func Equals(sender: AnyObject) {
        secondNumber = Double(theDisplay.text!)!
        if(operation == "+"){
            result = firstNumber + secondNumber
        } else if (operation == "-"){
            result = firstNumber - secondNumber
        } else if (operation == "x"){
            result = firstNumber * secondNumber
        } else if (operation == "/"){
            result = firstNumber / secondNumber
        } else if (operation == "%"){
            result = firstNumber % secondNumber
        } else if (operation == "Avg"){
            result = (secondNumber+total)/(count+1)
            count = 0
            total = 0
        } else if (operation == "Count"){
            result = count
        }
    
        if(result % 1 == 0){
            theDisplay.text = "\(Int(result))"
        } else {
            theDisplay.text = "\(result)"
        }
        firstNumber = result
        restart()
    }
    
    @IBAction func Clear(sender: AnyObject) {
        restart()
        theDisplay.text = "0"
        firstNumber = 0
    }
    
    func restart(){
        secondNumber = 0
        decimalCount = 0
        result = 0
        operation = ""
        count = 0
        total = 0
        isTyping = false

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

