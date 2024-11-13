//
//  TasksTabComponent.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 09/11/24.
//

import SwiftUI

struct TasksTabComponent: View {
    @State private var isInsightsEnable = false
    var isFromJob = false
    
    var body: some View {
        VStack(alignment: .center) {
            if isFromJob {
                TabsTitleWithCountView(title: "Invoices", count: 12, onActionTap: { actions in
                    if actions.actionableType == .insight {
                        withAnimation {
                            isInsightsEnable.toggle()
                        }
                    } else {
                        // Handle other actions if necessary
                    }
                }, actions: [
                    Actionable(isActive: false, assetName: "ic_insights", actionableType: .insight)
                ])
            }
            if isInsightsEnable {
                DraftWithPriceScroller()
                    .transition(.slide)
                    .animation(.default) // Use .default for animation compatibility
                    .padding(.bottom, 20 * iPadMultiplier)
            }
            
            SearchAndFilters(actions: [
                Actionable(isActive: false, assetName: "ic_filter", actionableType: .filter),
//                Actionable(isActive: true, assetName: "ic_insights", actionableType: .insight)
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
            
            let verticleList = [CommonVerticleListModel(id: "1", itemName: "Kitchen Light Fixing", title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",schedule: Client(name: "Due Date: ", info: "Nov. 4th, 2023 @12:45 PM"),client: ContactInfo(imgName: "justin_profile_icon", title: "Mukesh"), horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: assignedMembersArr)], status: "Complete", statusColor: "#5ED5A8", timeAgo: "3 Months ago", IsShowFlag: true)]
            TasksListsView(verticleLists: verticleList)
        }
        .padding(12 * iPadMultiplier)
    }
}

struct TasksTabComponent_Previews: PreviewProvider {
    static var previews: some View {
        TasksTabComponent()
    }
}
