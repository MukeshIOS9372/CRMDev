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
                    Image(systemName: "plus") // Plus icon after the text
                }
                .padding(10 * iPadMultiplier)
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(6 * iPadMultiplier)
            }
            .frame(height: 68 * iPadMultiplier)
            
            Button(action: {
                // Action for More Actions
            }) {
                HStack {
                    Text("More Actions") // Text for the first button
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                    Image(systemName: "chevron.down") // Plus icon after the text
                }
                .padding(10 * iPadMultiplier)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(6 * iPadMultiplier)
                    
            }
            .frame(height: 68 * iPadMultiplier)
        }
        .padding(.horizontal, 12 * iPadMultiplier)
//        .background(Color(.black))
    }
}

#Preview {
    MoreActionButtons()
}
