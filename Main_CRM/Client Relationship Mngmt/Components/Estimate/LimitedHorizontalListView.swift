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
            ForEach(0..<displayCount, id: \.self) { i in
                HStack(spacing: 8) { // Adjust this spacing between image and title
                    items[i].image()
                        .frame(width: 20, height: 20) // Ensure consistent size for images
                        .clipShape(Circle())
                    
                    items[i].title()
                }

                // Add dot and spacing if not the last visible item
                if i != displayCount - 1 {
//                    Spacer()
//                        .frame(width: 2)
                    Circle()
                        .fill(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5
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
                        .fill(Color(red: 0.819, green: 0.835, blue: 0.859)) // Hex #D1D5DB
                        .frame(width: 20, height: 20)
                    
                    Text("+\(items.count - visibleLimit)")
                        .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                        .font(.system(size: 10, weight: .regular))
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

struct LimitedHorizontalListViewListItem: Identifiable {
    let id = UUID()
    let image: () -> AnyView
    let title: () -> AnyView
}


struct PreviewLimitedHorizontalListView: View {
    var body: some View {
        // Sample items
        let items = (0..<6).map { i in
            LimitedHorizontalListViewListItem(
                image: {
                    AnyView(
                        Image("justin_profile_icon") // Ensure this image is added to your assets with this name
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                    )
                },
                title: {
                    AnyView(
                        Text("Item \(i + 1).")
                            .font(.custom("MyriadPro-Regular", size: 12))
                            .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
                            .fontWeight(.semibold)
                    )
                }
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











