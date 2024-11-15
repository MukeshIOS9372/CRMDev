//
//  VerticalLine.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

struct ExpandableTextView: View {
    let text: String
    let lineLimit: Int
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .lineLimit(isExpanded ? nil : lineLimit)
                .animation(.easeInOut, value: isExpanded).font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#656C73"))
            
            //            Button(action: {
            //                isExpanded.toggle()
            //            }) {
            Text(isExpanded ? "Show Less" : "Show More")
                .font(.caption)
                .foregroundColor(.blue)
                .simultaneousGesture(TapGesture().onEnded {
                    print("Tapped item description")
                    isExpanded.toggle()
                })
        }
    }
}


#Preview {
    ExpandableTextView(text: "To create a Show More / Show Less toggle for a text view in SwiftUI, you can use a state variable to control whether the full text is shown. Here’s how to set it up:", lineLimit: 1)
}
