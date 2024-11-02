//
//  PaymentsCardCell.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 02/11/24.
//

import SwiftUI

struct PaymentsCardCell: View {
    var body: some View {
        List() {
            // First item
            CommonVerticleListCell(itemName: "$41,254.25", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245", status: "Overdue", statusColor: "#E74C3C", amount: "INV - 0002451", timeAgo: "3 Months ago", category: "Equipment Rental", paymentID: "q-154442584548848")
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(.bottom, 15 * iPadMultiplier)

            
            // Second item
            CommonVerticleListCell(itemName: "$1,254.25", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245", status: "Paid", statusColor: "#5ED5A8", amount: "INV - 0002451", timeAgo: "3 Months ago", paymentID: "q-154442584548848")
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(.bottom, 15 * iPadMultiplier)
        }
        .listStyle(PlainListStyle())
        .background(Color.white)
        
    }
}

struct PaymentsCard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsCardCell()
    }
}
