//
//  JobsTabsComponent.swift
//  contractorplus
//
//  Created by Mukesh Behera on 30/10/24.
//  Copyright © 2024 ContractorPlus. All rights reserved.
//

import SwiftUI


struct JobsTabsComponent: View {
    @State private var isInsightsEnable = false
    
    var body: some View {
        VStack(alignment: .center) {
            if isInsightsEnable {
                DraftWithPriceScroller()
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
                ProfitabilityItem(title: "Material Cost", type: .itemCost, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: true)
            ]
            let verticleList = [CommonVerticleListModel(id: "2", itemName: "JOB- 00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245",schedule: "Nov. 4th, 2023 @12:45 PM", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: assignedMembersArr), HorizontalMembersView(title: "Subs : ", membersArr: assignedMembersArr)],progress: 0.7, status: "Overdue", statusColor: "#E74C3C",phases: Phases(current: 6, total: 12),tasks: Tasks(completed: 2, total: 6), timeAgo: "3 Months ago", profitabilityArr: profitabilityArr, badgeCount: 12, isMessageShow: true)]
            JobsListsView(verticleLists: verticleList)
        }
        .padding(12 * iPadMultiplier)
    }
}

struct JobsTabsComponent_Previews: PreviewProvider {
    static var previews: some View {
        JobsTabsComponent()
    }
}
