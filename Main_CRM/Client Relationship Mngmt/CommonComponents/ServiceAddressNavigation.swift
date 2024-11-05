//
//  ServiceAddressNavigation.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 04/11/24.
//

import SwiftUI

struct ServiceAddressNavigation: View {
    var iconName: String
    var number: String
    var isZellow: Bool
    
    var body: some View {
        HStack {
            // Icon (using system image or custom image)
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16 * iPadMultiplier, height: 16 * iPadMultiplier)
                .foregroundColor(Color(hexString: "#656C73"))
            
            // Text
            if isZellow {
                Image("ic_requests_arrow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16 * iPadMultiplier, height: 16 * iPadMultiplier)
                    .foregroundColor(Color(hexString: "#3B82F6"))
            } else {
                Text(number)
                    .foregroundColor(Color(hexString: "#3F464B"))
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
            }
        }
        .padding(.horizontal, 6 * iPadMultiplier)
        .padding(.vertical, 5 * iPadMultiplier)
        .background(
            RoundedRectangle(cornerRadius: 6 * iPadMultiplier)
                .fill(Color(hexString: "#FAFAFA"))
            //                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 5 * iPadMultiplier)
//                        .stroke(Color(hexString: "#F0F0F0"), lineWidth: 1)
//                )
        )
    }
}

#Preview {
    ServiceAddressNavigation(iconName: "ic_bed-fill", number: "k", isZellow: false)
    ServiceAddressNavigation(iconName: "ic_bed-fill", number: "k", isZellow: true)
}
