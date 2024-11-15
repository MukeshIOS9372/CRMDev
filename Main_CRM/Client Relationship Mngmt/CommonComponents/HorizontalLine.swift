//
//  HorizontalLine.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

struct HorizontalLine: View {
    var color: Color = .gray
    var height: CGFloat = 1.0

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}


struct VerticalLine: View {
    var color: Color = .gray
    var width: CGFloat = 1.0

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width:width)
            //.edgesIgnoringSafeArea(.vertical)
    }
}

#Preview {
    HorizontalLine()
}
