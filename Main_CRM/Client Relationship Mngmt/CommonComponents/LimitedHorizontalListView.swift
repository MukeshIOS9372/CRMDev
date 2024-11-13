//
//  LimitedHorizontalListView.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 28/10/24.
//

import SwiftUI

struct LimitedHorizontalListView: View {
    let items: [LimitedHorizontalListViewListItem]
    var visibleLimit: Int = 2

    var body: some View {
        let displayCount = min(items.count, visibleLimit)
        
        HStack {
            ForEach(Array(items.enumerated()), id: \.element.id) {index, i in
                HStack(spacing: 8) { // Adjust this spacing between image and title
                    Image(i.image)
                        .frame(width: 20, height: 20) // Ensure consistent size for images
                        .clipShape(Circle())
                    Text(i.title)
                        .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                }

                // Add dot and spacing if not the last visible item
                if index != displayCount - 1 {
//                    Spacer()
//                        .frame(width: 2)
                    Circle()
                        .fill(Color(App_Colors.App_Light_Gray_Color_3.rawValue)) // Hex #ADB1B5
                        .frame(width: 2.5, height: 2.5)
//                    Spacer()
//                        .frame(width: 2)
                }
            }

            // Display the "+x" circle if there are hidden items
            if items.count > visibleLimit {
                Spacer()
                    .frame(width: 2)
                ZStack {
                    Circle()
                        .fill(Color(App_Colors.App_Light_Gray_Color_4.rawValue)) // Hex #D1D5DB
                        .frame(width: 20, height: 20)
                    
                    Text("+\(items.count - visibleLimit)")
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue)) // Hex #656C73
                        .font(Font.custom(FontBook.Regular.rawValue, size: 10 * iPadMultiplier))
                        .padding(2)
                }
            }
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, alignment: .leading) // Align content to the leading edge
        .frame(maxHeight: .infinity)
//        .padding(.horizontal, 8)
//        .frame(maxHeight: .infinity)
//        .scrollableAxis(.horizontal) // This modifier doesn't exist in SwiftUI, see explanation below
    }
}


struct LimitedHorizontalListViewListItem: Identifiable, Decodable {
    var id = UUID()
    let image: String
    let title: String
    
    var imageName: some View {
        AnyView(
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                .clipShape(Circle())
        )
    }
    
    var titleText: some View {
        AnyView(
            Text(title)
                .font(Font.custom(FontBook.Regular.rawValue, size: 5 * iPadMultiplier))
                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
        )
    }
}


struct PreviewLimitedHorizontalListView: View {
    var body: some View {
        // Sample items
        let items = (0..<6).map { i in
            LimitedHorizontalListViewListItem(
                image: "justin_profile_icon",
                title: "Item \(i + 1)."
            )
        }

        // Pass sample items to LimitedHorizontalListView
        LimitedHorizontalListView(
            items: items,
            visibleLimit: 3
        )
        .padding()
    }
}

// SwiftUI Preview
struct PreviewLimitedHorizontalListView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewLimitedHorizontalListView()
    }
}











