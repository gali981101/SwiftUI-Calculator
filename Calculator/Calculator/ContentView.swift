//
//  ContentView.swift
//  Calculator
//
//  Created by Terry Jason on 2023/10/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var operation: String = ""
    @State private var result: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            CustomTextField(title: "First Number", text: $firstNumber)
            
            CustomTextField(title: "Second Number", text: $secondNumber)
            
            Picker("Picker", selection: $operation) {
                Text("+").tag("+")
                Text("-").tag("-")
                Text("*").tag("*")
                Text("/").tag("/")
            }
            .frame(width: 350)
            .pickerStyle(SegmentedPickerStyle())
            
            Text(result)
            
            Button(action: {
                result = Calculator.calculate(firstNumber, secondNumber, operation)
            }, label: {
                Text("Calculate")
            })
            .padding()
            .frame(width: 350, height: 45)
            .foregroundStyle(.white)
            .background(Color.green)
            .cornerRadius(10)
        }
    }
    
}

class Calculator {
    
    static fileprivate func calculate(_ firstNum: String, _ secondNum: String, _ op: String) -> String {
        if let num1 = Double(firstNum), let num2 = Double(secondNum) {
            return checkResult(of: calculateNumber(num1, num2, op))
        }
        
        return "請輸入有效數字"
    }
    
    static private func calculateNumber(_ numOne: Double, _ numTwo: Double, _ op: String) -> Double {
        switch op {
        case "+":
            numOne + numTwo
        case "-":
            numOne - numTwo
        case "*":
            numOne * numTwo
        case "/":
            numOne / numTwo
        default:
            0
        }
    }
    
    static private func checkResult(of result: Double) -> String {
        String(result)
    }
    
}

#Preview {
    ContentView()
}
