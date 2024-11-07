//
//  ExpenseTabComponent.swift
//  MY_Crm
//
//  Created by Mukesh Behera on 06/11/24.
//

import SwiftUI


struct ExpenseTabsComponent: View {
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
            let verticleList = [CommonVerticleListModel(id: "3", itemName: "$41,254.25", title: "Ceiling Fan Recoiling Work", horizontalMembers: [HorizontalMembersView(title: "Reimbursable to: ", membersArr: assignedMembersArr)], status: "Overdue", statusColor: "#E74C3C", timeAgo: "3 Months ago", category: Client(name: "Type: ", info: "Non-Reimbursable"), paymentID: "q-154442584548848")]
            ExpenseListsView(verticleLists: verticleList) // Ensure this function exists in your code
        }
        .padding(12 * iPadMultiplier)
    }
}

struct ExpenseTabsComponent_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTabsComponent()
    }
}
