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
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                    HStack(spacing: 1){
                        Text("\(progress)")
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                            .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                        Text("/\(progressMax)")
                            .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                            .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
                    }
                }
                Spacer()
                Text(percentage)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
            }
            
            // Price at the bottom
            Text(price)
                .font(Font.custom(FontBook.Semibold.rawValue, size: 18 * iPadMultiplier))
                .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
        }
        .padding(20 * iPadMultiplier)
        .background(Color(App_Colors.App_White_Color.rawValue))
        .cornerRadius(8 * iPadMultiplier)
//        .shadow(radius: 2)
        .frame(width: 160 * iPadMultiplier, height: 90 * iPadMultiplier) // Adjust width and height as needed
        .overlay(
            RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                .stroke((Color(App_Colors.App_White_Gray_Color.rawValue)), lineWidth: 1 * iPadMultiplier)
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
