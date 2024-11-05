//
//  ShoppingListTabsComponent.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 04/11/24.
//

import SwiftUI

struct ShoppingListTabsComponent: View {
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
                ), LimitedHorizontalListViewListItem(
                    image: "justin_profile_icon",
                    title: "Mukesh"
                )
            ]
            let verticleList = [CommonVerticleListModel(id: "2", itemName: "$41,254.25", title: "Plumbing Items necessary*", cartItemsCount: 6, relatedTo: "EST - 000241", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: assignedMembersArr)], status: "In Progress", statusColor: "#FF9800", timeAgo: "3 Months ago")]
            ShoppingListListsView(verticleLists: verticleList) // Ensure this function exists in your code
        }
        .padding(12 * iPadMultiplier)
    }
}

struct ShoppingListTabsComponent_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceTabComponent()
    }
}
