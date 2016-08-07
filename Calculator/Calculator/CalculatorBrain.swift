//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Rajesh Vaddi on 7/30/16.
//  Copyright © 2016 iSol.tech. All rights reserved.
//

import Foundation

func multiply(op1 : Double, op2: Double) -> Double{
    return op1 * op2
}

class CalculatorBrain{
    
    private var accumulator = 0.0
    
    func setOperand(_ operand: Double){ accumulator = operand}

    
    var operations : Dictionary<String, Operation> = [
        "π" : Operation.Constant(M_PI),//M_PI,
        "e" : Operation.Constant(M_E),//M_E,
        "√" : Operation.UnaryOperation(sqrt),//sqrt,
        "cos" : Operation.UnaryOperation(cos), //cos
        "✕" : Operation.BinaryOperation({$0 * $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "=" : Operation.Equals,
        "·" : Operation.Dot
    ]
    
    enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
        case Dot
    }
    
    func performOperation(_ symbol :String) {
        if let operation = operations[symbol]{
            switch operation {
            case .Constant (let value) : accumulator = value
            case .BinaryOperation(let function)  :
                executePendingBinaryOperation()
                pending = pendingBinaryOperationInfo(binaryFunciton: function, firstOperand: accumulator)
            case .UnaryOperation(let function) :accumulator = function(accumulator)
            case .Equals :  executePendingBinaryOperation()
            case .Dot : appendTextToAlreadyDisplayedText()
            }
        }
    }
    
    private func appendTextToAlreadyDisplayedText(){
        
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunciton(pending!.firstOperand, accumulator)
            pending=nil
        }

    }

    private var pending : pendingBinaryOperationInfo?
    
    struct pendingBinaryOperationInfo {
        var binaryFunciton : (Double, Double) -> Double
        var firstOperand : Double
    }
    var result : Double{
        get{
            return accumulator
        }
    }
}
