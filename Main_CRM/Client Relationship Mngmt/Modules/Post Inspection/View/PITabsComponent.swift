//
//  PITabsComponent.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 02/11/24.
//

import SwiftUI

struct PITabsComponent: View {
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
            
            let verticleList = [CommonVerticleListModel(id: "2", itemName: "POI-0002154", title: "Ceiling Fan Recoiling Work",relatedTo: "EST - 000241", address: "123 Main Street, Texas 451245", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: assignedMembersArr)], status: "Overdue", statusColor: "#E74C3C", timeAgo: "3 Months ago")]
            PIListsView(verticleLists: verticleList) // Ensure this function exists in your code
        }
        .padding(12 * iPadMultiplier)
    }
}

struct PITabsComponent_Previews: PreviewProvider {
    static var previews: some View {
        PITabsComponent()
    }
}
