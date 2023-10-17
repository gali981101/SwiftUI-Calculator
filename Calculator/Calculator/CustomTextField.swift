//
//  CustomTextField.swift
//  Calculator
//
//  Created by Terry Jason on 2023/10/17.
//

import SwiftUI

struct CustomTextField: View {
    
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack(content: {
            TextField(title, text: $text)
                .keyboardType(.decimalPad)
                .frame(width: 320, height: 10)
                .padding()
                .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                .cornerRadius(10)
        })
        .padding(1)
    }
    
}

