//
//  ContactOption.swift
//  contractorplus
//
//  Created by Mukesh Behera on 23/10/24.
//  Copyright © 2024 ContractorPlus. All rights reserved.
//

import SwiftUI

struct ContactOption: View {
    var iconName: String
    var text: String
    var action: () -> Void  

    var body: some View {        
        
        Button(action: {
            action()  // Trigger the action passed as a parameter
        }) {
            HStack {
                // Icon (using system image or custom image)
                Image(iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16 * iPadMultiplier, height: 16 * iPadMultiplier)
                    .foregroundColor(.gray)
                
                // Text
                Text(text)
                    .foregroundColor(.black)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 10 * iPadMultiplier))
                    .fontWeight(.medium)
                
                // Dropdown Indicator (chevron down)
                Image("ic_down_dropdown")
                    .foregroundColor(.gray)
                    .font(.system(size: 12 * iPadMultiplier))
            }
            .padding(.horizontal, 6 * iPadMultiplier)
            .padding(.vertical, 5 * iPadMultiplier)
            .background(
                RoundedRectangle(cornerRadius: 12 * iPadMultiplier)
                    .fill(Color(hexString: "#FAFAFA"))
//                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * iPadMultiplier)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
            )
        }
    }
}

struct CustomIconTextButton_Previews: PreviewProvider {
    static var previews: some View {
        ContactOption(iconName: "ic_mail_gray", text: "Email") {
            print("Email button tapped")
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
