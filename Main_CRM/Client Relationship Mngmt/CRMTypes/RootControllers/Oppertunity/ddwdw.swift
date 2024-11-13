//
//  ddwdw.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 13/11/24.
//

import SwiftUI

struct CurrencyTextField: View {
    @State private var amount: String = "1,370"

    var body: some View {
        HStack {
            Text("$")
                .foregroundColor(.gray)
            
            Divider() // Separator line
                .frame(height: 30) // Adjust height as needed
                .background(Color.gray.opacity(0.5))
            
            TextField("0", text: $amount)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.leading)
        }
        .padding(9)
        .padding(.horizontal, 10)
//        .padding(.vertical, 8)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
//        .frame(width: 120) // Set a fixed width if needed
    }
}

struct CurrencyTextField_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyTextField()
    }
}
