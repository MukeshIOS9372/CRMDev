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
            Image("ic_dollar_sign")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                .padding(.trailing, 8 * iPadMultiplier)
//
            Divider()
                .frame(height: 30 * iPadMultiplier)
                .background(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
                .padding(.trailing, 8 * iPadMultiplier)
            
            TextField("0", text: $amount)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.leading)
                .font(Font.custom(FontBook.Regular.rawValue, size: 18 * iPadMultiplier))
                .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
        }
        .padding(9 * iPadMultiplier)
        .padding(.horizontal, 10 * iPadMultiplier)
//        .padding(.vertical, 8)
        .cornerRadius(5 * iPadMultiplier)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                .stroke(Color(App_Colors.App_Light_Gray_Color_3.rawValue), lineWidth: 1 * iPadMultiplier)
        )
    }
}

struct CurrencyTextField_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyTextField()
    }
}
