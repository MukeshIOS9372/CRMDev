//
//  WOTabsComponent.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 30/10/24.
//

import SwiftUI

struct WOTabsComponent: View {
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
                Actionable(isActive: true, assetName: "ic_insights", actionableType: .insight)
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
            let assignedMembersArr = [
                LimitedHorizontalListViewListItem(
                    image: "justin_profile_icon",
                    title: "Mukesh"
                )
            ]
            let profitabilityArr = [
                ProfitabilityItem(title: "Gross Profit", type: .grossProfit, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
                ProfitabilityItem(title: "Line Items", type: .generalItem, grossProfitPercent: "$14,641.85", grossProfitAmount: "$151,663.22", rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
                ProfitabilityItem(title: "Material Cost", type: .itemCost, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: true)]
            let verticleList = [CommonVerticleListModel(id: "ii", itemName: "WO-00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245",schedule: "Nov. 4th, 2023 @12:45 PM", horizontalMembers: [HorizontalMembersView(title: "Delegated To : ", membersArr: assignedMembersArr)], status: "Overdue", statusColor: "#E74C3C", amount: "$300.00", timeAgo: "3 Months ago", profitabilityArr: profitabilityArr)]
            WorkOrderListsView(verticleLists: verticleList) // Ensure this function exists in your code
        }
        .padding(12 * iPadMultiplier)
    }
}

struct WOTabs_Component_Previews: PreviewProvider {
    static var previews: some View {
        WOTabsComponent()
    }
}
