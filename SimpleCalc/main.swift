//
//  main.swift
//  SimpleCalc
//
//  Created by Derry Cheng on 10/8/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.

//  This is a console program where users can do some simple or extended calculations.
//  Users can do simple calculations (+,-,*,/,%) either on multiple or single lines.
//  The syntax for multiple lines input is: "number". Return. "expression". Return. "number".
//  The syntax for single line input is: "number. space. expression. space. number". Return.

//  Users can calcualte extended calculations using the following functions:
//  factorials use "fact", average use "avg", or to count the numbers use "count".
//  Users can use these functions by following this syntax:
//  "number number number...function" Ex: "2 4 6 8 10 avg" Results = 6.0.


import Foundation

print("Hello, welcome to the calculator!")
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData,
        encoding:NSUTF8StringEncoding) as! String
    return
        result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Double {
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
}

var play : String = "Y";
while (play.lowercaseString == "y") {
    print("Let me know what you want to calculate.");
    
    // Splits input into arrays
    let userInput : String = input()
    let userInputArr = userInput.componentsSeparatedByString(" ")
    var result : Double = -1;
    var resultDouble : Double = -1.0;
    var avgStatus : Int = 0;
    
    if (userInputArr.count != 1){
        let expression = userInputArr [1]
        if (expression == "+"){
            result = convert(userInputArr[0]) + convert(userInputArr[2])
        } else if (expression == "-"){
            result = convert(userInputArr[0]) - convert(userInputArr[2])
        } else if (expression == "*"){
            result = convert(userInputArr[0]) * convert(userInputArr[2])
        } else if (expression == "/"){
            result = convert(userInputArr[0]) / convert(userInputArr[2])
        } else if (expression == "%"){
            result = convert(userInputArr[0]) % convert(userInputArr[2])
        } else if (userInputArr[userInputArr.count-1] == "count"){
            result = Double(userInputArr.count)-1.0;
        } else if (userInputArr[userInputArr.count-1] == "avg"){
            var total = 0.0;
            for var i = 0; i <= userInputArr.count-2; i++ {
                total += Double(convert(userInputArr[i]));
            }
            resultDouble = Double(total/(Double(userInputArr.count)-1.0));
            avgStatus = 1;
        } else if (userInputArr[userInputArr.count-1] == "fact"){
            var total : Double = 1.0;
            var temp = convert(userInputArr[0]);
            if(temp < 0){
                temp = temp * -1
            }
            for var i = 1.0; i <= temp; i++ {
                total *= i;
            }
            
            result = total;
            if(convert(userInputArr[0]) < 0){
                result = -1.0 * total
            }
        }
    } else {
        let firstnum = convert(userInputArr[0])
        let expression = input()
        let secondnum = convert(input())
        if(expression == "+"){
            result = firstnum + secondnum
        } else if(expression == "-"){
            result = firstnum - secondnum
        } else if(expression == "*"){
            result = firstnum * secondnum
        } else if(expression == "/"){
            result = firstnum / secondnum
        } else if(expression == "%"){
            result = firstnum % secondnum
        }
    }

    // Converts double values to int if results are whole numbers. 
    // Prints results.
    if(avgStatus == 1){
        if (resultDouble % 1 == 0){
            var myIntValue : Int = Int(resultDouble)
            print("Result: \(myIntValue)");
        } else {
            print("Result: \(resultDouble)");
        }
    } else if (result % 1 == 0){
        var myIntValue : Int = Int(result)
        print("Result: \(myIntValue)");
    } else if (result % 1 != 0){
        print("Result: \(result)");
    } else {
        print("Please check your input");
    }
    
    print("");
    print ("Calculate again?  Y/N")
    play = input()
}