//
//  StatusesCardView.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 30/10/24.
//

import SwiftUI

struct StatusesCardView: View {
    var title: String
    var progress: Int
    var numerator: Int
    var denominator: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Title and Progress
            HStack {
                Text(title)
                    .font(Font.custom(FontBook.Regular.rawValue, size: 16 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                
                Spacer()
                
                Text("\(progress)%")
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Light_Green_Color.rawValue))
            }
            
            // Fraction (Numerator / Denominator)
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text("\(numerator)")
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 24 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
                
                Text("/\(denominator)")
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
            }
        }
        .padding(20 * iPadMultiplier)
        .background(Color(App_Colors.App_White_Color.rawValue))
        .cornerRadius(8 * iPadMultiplier)
//        .shadow(radius: 2)
        .frame(width: 160 * iPadMultiplier, height: 90 * iPadMultiplier) // Adjust width and height as needed
        .overlay(
            RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1 * iPadMultiplier)
        )
    }
}

struct ScrollableStatusCardsView: View {
    let items: [(title: String, progress: Int, numerator: Int, denominator: Int)]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(items, id: \.title) { item in
                    StatusesCardView(
                        title: item.title,
                        progress: item.progress,
                        numerator: item.numerator,
                        denominator: item.denominator
                    )
                }
            }
//            .padding(.horizontal)
        }
    }
}

struct StatusesCard_ContentView: View {
    var body: some View {
        ScrollableStatusCardsView(items: [
            (title: "In Progress", progress: 82, numerator: 2, denominator: 41),
            (title: "Completed", progress: 50, numerator: 21, denominator: 41),
            (title: "Pending", progress: 30, numerator: 12, denominator: 41),
            (title: "On Hold", progress: 10, numerator: 4, denominator: 41)
        ])
    }
}

struct StatusesCard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StatusesCard_ContentView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
