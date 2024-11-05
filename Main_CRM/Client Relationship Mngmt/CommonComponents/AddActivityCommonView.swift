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
                    .foregroundColor(Color(hexString: "#656C73"))
            }

            Button(action: {
                // Action for Phone
            }) {
                Image("ic_mail_envelope")
                    .foregroundColor(Color(hexString: "#656C73"))
            }

            Button(action: {
                // Action for Social
            }) {
                Image("ic_chat_icon")
                    .foregroundColor(Color(hexString: "#656C73"))
            }
            
            Button(action: {
                // Action for More Actions
            }) {
                HStack {
                    Image("ic_phone_icon").foregroundColor(Color(hexString: "#656C73"))
                    Image("ic_down_dropdown").foregroundColor(Color(hexString: "#656C73")) // Plus icon after the text
                }
                .padding(10 * iPadMultiplier)
                .cornerRadius(6 * iPadMultiplier)
                    
            }
            .frame(height: 30 * iPadMultiplier)
            .background(
                RoundedRectangle(cornerRadius: 12 * iPadMultiplier)
                    .fill(Color(hexString: "#FAFAFA"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * iPadMultiplier)
                            .stroke(Color(hexString: "#D2D4D6"), lineWidth: 1)
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
