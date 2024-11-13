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
    var rightIconName: String?
    var shape: ProfileImageShape
    var badgeNumber: Int = 0
    var action: () -> Void

    var body: some View {        
        
        Button(action: {
            action()  // Trigger the action passed as a parameter
        }) {
            HStack {
                // Icon (using system image or custom image)
                if shape == .circular {
                    Image(iconName)
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16 * iPadMultiplier, height: 16 * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                } else {
                    Image(iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 15)
                        .clipShape(RoundedRectangle(cornerRadius: 2 * iPadMultiplier))
                        .overlay(RoundedRectangle(cornerRadius: 2 * iPadMultiplier).stroke(Color.white, lineWidth: 1 * iPadMultiplier))
                }
                // Text
                Text(text)
                    .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 10 * iPadMultiplier))
                    .fontWeight(.medium)
                if badgeNumber > 0 {
                    Text("\(badgeNumber)")
                        .font(Font.custom(FontBook.Regular.rawValue, size: 10 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                        .frame(width: 20, height: 20)
                        .background(Circle().fill(Color(App_Colors.App_White_Gray_Color.rawValue)))
                } else if !(rightIconName?.isEmpty ?? false) {
                    Image(rightIconName ?? "")
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                        .font(.system(size: 12 * iPadMultiplier))
                }
                
            }
            .padding(.horizontal, 6 * iPadMultiplier)
            .padding(.vertical, 5 * iPadMultiplier)
            .frame(height: 25)
            .background(
                RoundedRectangle(cornerRadius: 12 * iPadMultiplier)
                    .fill(Color(App_Colors.App_White_Color.rawValue))
                //                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * iPadMultiplier)
                            .stroke(Color(App_Colors.App_White_Gray_Color.rawValue), lineWidth: 1)
                    )
            )
        }
    }
}

struct CustomIconTextButton_Previews: PreviewProvider {
    static var previews: some View {
        ContactOption(iconName: "preview_img", text: "Email", rightIconName: "ic_down_dropdown", shape: .circular) {
            print("Email button tapped")
        }
        .padding()
        .background(Color(App_Colors.App_White_Color.rawValue))
    }
}
