//
//  ActionButton.swift
//  ClientRelationShip
//
//  Created by Mukesh Behera on 24/10/24.
//

import SwiftUI

struct MoreActionButtons: View {
    var body: some View {
        
        HStack(spacing: 16 * iPadMultiplier) {
            Button(action: {
                // Action for New Estimate
            }) {
                HStack {
                    Text("New Estimate") // Text for the first button
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                        .foregroundColor(Color(hexString: "#3B82F6"))
                    Image(systemName: "plus") // Plus icon after the text
                        .foregroundColor(Color(hexString: "#3B82F6"))
                }
                .padding(10 * iPadMultiplier)
                .frame(maxWidth: .infinity)
                .background(Color(hexString: "#DBEAFE"))
                .cornerRadius(6 * iPadMultiplier)
            }
            .frame(height: 68 * iPadMultiplier)
            
            Button(action: {
                // Action for More Actions
            }) {
                HStack {
                    Text("More Actions") // Text for the first button
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                        .foregroundColor(.white)
                    Image(systemName: "chevron.down") // Plus icon after the text
                        .foregroundColor(.white)
                }
                .padding(10 * iPadMultiplier)
                .frame(maxWidth: .infinity)
                .background(Color(hexString: "#3B82F6"))
                .cornerRadius(6 * iPadMultiplier)
                    
            }
            .frame(height: 68 * iPadMultiplier)
        }
        .padding(.horizontal, 12 * iPadMultiplier)
    }
}

#Preview {
    MoreActionButtons()
}
