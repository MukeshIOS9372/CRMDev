//
//  RoundedBorderChip.swift
//  contractorplus
//
//  Created by Mukesh Behera on 23/10/24.
//  Copyright © 2024 ContractorPlus. All rights reserved.
//

import SwiftUI

struct RoundedBorderChip: View {
    var text: String
    var color: Color
    var trailingIcon: Image?

    var body: some View {
        
        HStack(spacing: 4 * iPadMultiplier) { // Adjust spacing for iPad and iPhone
            Text(text)
                .font(Font.custom(FontBook.Semibold.rawValue, size: 10 * iPadMultiplier)) // Adjust font size
                .foregroundColor(color)
                .padding(.horizontal, 6 * iPadMultiplier) // Adjust padding for iPad
                .padding(.vertical, 4 * iPadMultiplier) // Adjust padding for iPad
                .background(color.opacity(0.1), in: RoundedRectangle(cornerRadius: 100 * iPadMultiplier)) // Adjust corner radius
//                .background(RoundedRectangle(cornerRadius: 100 * iPadMultiplier)
//                                .fill(Color.primary.opacity(0.1)))
            
            if let trailingIcon = trailingIcon {
                trailingIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16 * iPadMultiplier, height: 16 * iPadMultiplier) // Adjust icon size
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 100 * iPadMultiplier) // Adjust stroke radius for iPad
                .stroke(color, lineWidth: 1 * iPadMultiplier) // Adjust border thickness
        )
    }
}

struct RoundedBorderChip_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoundedBorderChip(text: "Residential", color: .green)
                .padding()
                .previewDevice("iPhone 12")
                .previewLayout(.sizeThatFits)
            
            RoundedBorderChip(text: "Residential", color: .green)
                .padding()
                .previewDevice("iPad (8th generation)")
                .previewLayout(.sizeThatFits)
        }
    }
}













