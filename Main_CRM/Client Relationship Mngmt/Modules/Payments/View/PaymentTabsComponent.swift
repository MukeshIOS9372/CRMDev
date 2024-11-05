//
//  PaymentTabsComponent.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 02/11/24.
//

import SwiftUI

struct PaymentTabsComponent: View {
    @State private var isInsightsEnable = false
    
    var body: some View {
        VStack(alignment: .center) {
            if isInsightsEnable {
                ScrollableStatusCardsView(items: [
                    (title: "In Progress", progress: 82, numerator: 2, denominator: 41),
                    (title: "Completed", progress: 50, numerator: 21, denominator: 41),
                    (title: "Pending", progress: 30, numerator: 12, denominator: 41),
                    (title: "On Hold", progress: 10, numerator: 4, denominator: 41)
                ])
                .transition(.slide)
                .animation(.default) // Use .default for animation compatibility
                .padding(.bottom, 20 * iPadMultiplier)
            }
            
            SearchAndFilters(actions: [
                Actionable(isActive: false, assetName: "ic_filter", actionableType: .filter),
            ], onValueChange: { _ in }, onActionTap: { actions in
                
                if actions.actionableType == .insight {
                    withAnimation {
                        isInsightsEnable.toggle()
                    }
                } else {
                    // Handle other actions if necessary
                }
                print(actions.actionableType)
            })
            
            Spacer().frame(height: 20 * iPadMultiplier)
            let verticleList = [CommonVerticleListModel(id: "3", itemName: "$41,254.25", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245", status: "Overdue", statusColor: "#E74C3C", amount: "INV - 0002451", timeAgo: "3 Months ago", category: "Equipment Rental", paymentID: "q-154442584548848")]
            PaymentsListsView(verticleLists: verticleList)
                
        }
        .padding(12 * iPadMultiplier)
    }
}

struct PaymentTabsComponent_Component_Previews: PreviewProvider {
    static var previews: some View {
        PaymentTabsComponent()
    }
}
