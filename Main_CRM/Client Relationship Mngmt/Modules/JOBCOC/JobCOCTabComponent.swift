//
//  JobCOCTabComponent.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 09/11/24.
//

import SwiftUI

struct JobCOCTabComponent: View {
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
            
            
            
            let verticleList = [CommonVerticleListModel(id: "1", itemName: "Hello Title Job COC",relatedTo: "JOB - 000241", address: "82 Hannah Villa", status: "Overdue", statusColor: "#E74C3C", category: Client(name: "Approved: ", info: "Apr. 12th, 2024"), isShowMenu: true)]
            JobCOCListsView(verticleLists: verticleList)
        }
        .padding(12 * iPadMultiplier)
    }
}

struct JobCOCTabComponent_Previews: PreviewProvider {
    static var previews: some View {
        JobCOCTabComponent()
    }
}
