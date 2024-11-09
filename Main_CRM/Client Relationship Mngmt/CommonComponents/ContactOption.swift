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
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16 * iPadMultiplier, height: 16 * iPadMultiplier)
                        .foregroundColor(Color(hexString: "#656C73"))
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
                    .foregroundColor(Color(hexString: "#3F464B"))
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 10 * iPadMultiplier))
                    .fontWeight(.medium)
                if badgeNumber > 0 {
                    Text("\(badgeNumber)")
                        .font(Font.custom(FontBook.Regular.rawValue, size: 10 * iPadMultiplier))
                        .foregroundColor(Color(hexString: "#656C73"))
                        .frame(width: 20, height: 20)
                        .background(Circle().fill(Color(hexString: "#F0F0F0")))
                } else if !(rightIconName?.isEmpty ?? false) {
                    Image(rightIconName ?? "")
                        .foregroundColor(Color(hexString: "#656C73"))
                        .font(.system(size: 12 * iPadMultiplier))
                }
                
            }
            .padding(.horizontal, 6 * iPadMultiplier)
            .padding(.vertical, 5 * iPadMultiplier)
            .frame(height: 25)
            .background(
                RoundedRectangle(cornerRadius: 12 * iPadMultiplier)
                    .fill(Color(hexString: "#FAFAFA"))
                //                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * iPadMultiplier)
                            .stroke(Color(hexString: "#F0F0F0"), lineWidth: 1)
                    )
            )
        }
    }
}

struct CustomIconTextButton_Previews: PreviewProvider {
    static var previews: some View {
        ContactOption(iconName: "preview_img", text: "Email", rightIconName: "ic_down_dropdown", shape: .rectangular) {
            print("Email button tapped")
        }
        .padding()
        .background(Color(hexString: "#FAFAFA"))
    }
}
