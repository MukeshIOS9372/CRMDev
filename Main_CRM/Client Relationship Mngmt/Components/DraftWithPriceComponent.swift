//
//  DraftWithPriceComponent.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 25/10/24.
//

import SwiftUI

struct StatusCardView: View {
    var status: String
    var progress: String
    var progressMax: String
    var percentage: String
    var price: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15 * iPadMultiplier) {
            // Status and Progress at the top
            HStack {
                HStack(spacing: 0){
                    Text("\(status) - ")
                        .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                        .foregroundColor(.gray)
                    HStack(spacing: 1){
                        Text("\(progress)")
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                            .foregroundColor(.gray)
                        Text("/\(progressMax)")
                            .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                Text(percentage)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(.gray)
            }
            
            // Price at the bottom
            Text(price)
                .font(Font.custom(FontBook.Semibold.rawValue, size: 18 * iPadMultiplier))
                .foregroundColor(.black)
        }
        .padding(20 * iPadMultiplier)
        .background(Color(hexString: "#FAFAFA"))
        .cornerRadius(8 * iPadMultiplier)
//        .shadow(radius: 2)
        .frame(width: 160 * iPadMultiplier, height: 90 * iPadMultiplier) // Adjust width and height as needed
        .overlay(
            RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1 * iPadMultiplier)
        )
    }
}

struct StatusCardContentView: View {
    var body: some View {
        // Example usage of the StatusCardView component
        StatusCardView(status: "Draft", progress: "4", progressMax: "41", percentage: "23%", price: "$151,663.22")
    }
}

struct StatusCardView_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StatusCardContentView()
    }
}
