//
//  DraftWithPriceScroller.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 25/10/24.
//

import SwiftUI

struct DraftWithPriceScroller: View {
    let cardData = [
            (status: "Draft", progress: "4", progressMax: "41", percentage: "23%", price: "$151,663.22"),
            (status: "Sent", progress: "7", progressMax: "41", percentage: "32%", price: "$105,400.50"),
            (status: "Expired", progress: "10", progressMax: "41", percentage: "45%", price: "$200,000.00"),
            // Add more data as needed
        ]
    
    var body: some View {
            
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10 * iPadMultiplier) {
//                CircularProgressView(
//                    total: 411,
//                    segments: [
//                        (color: Color.green, value: 0.25),
//                        (color: Color.orange, value: 0.20),
//                        (color: Color.red, value: 0.55),
//                        (color: Color.blue, value: 0.20)
//                    ]
//                )
                ForEach(cardData, id: \.status) { data in
                    StatusCardView(status: data.status, progress: data.progress, progressMax: data.progressMax, percentage: data.percentage, price: data.price)
                }
            }
            .padding(5 * iPadMultiplier)
        }

    }
}

#Preview {
    DraftWithPriceScroller()
}
