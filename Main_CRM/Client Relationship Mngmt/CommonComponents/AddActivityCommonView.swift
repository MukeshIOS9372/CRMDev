//
//  AddActivityCommonView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 04/11/24.
//

import SwiftUI

struct AddActivityCommonView: View {
    var body: some View {
        // Buttons for Email, Phone, Social
        HStack(spacing: 20 * iPadMultiplier) {
            Text("Add Activity")
                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
            Spacer()
            Button(action: {
                // Action for Email
            }) {
                Image("ic_notepad")
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
            }

            Button(action: {
                // Action for Phone
            }) {
                Image("ic_mail_envelope")
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
            }

            Button(action: {
                // Action for Social
            }) {
                Image("ic_chat_icon")
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
            }
            
            Button(action: {
                // Action for More Actions
            }) {
                HStack {
                    Image("ic_phone_icon").foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                    Image("ic_down_dropdown").foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue)) // Plus icon after the text
                }
                .padding(10 * iPadMultiplier)
                .cornerRadius(6 * iPadMultiplier)
                    
            }
            .frame(height: 30 * iPadMultiplier)
            .background(
                RoundedRectangle(cornerRadius: 12 * iPadMultiplier)
                    .fill(Color(App_Colors.App_White_Color.rawValue))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * iPadMultiplier)
                            .stroke(Color(App_Colors.App_Light_Gray_Color_1.rawValue), lineWidth: 1 * iPadMultiplier)
                    )
            )
        }
        .padding(.horizontal, 12 * iPadMultiplier)
        .padding(.bottom, 12 * iPadMultiplier)
    }
}

#Preview {
    AddActivityCommonView()
}
