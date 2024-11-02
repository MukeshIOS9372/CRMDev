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
            WorkOrderCardCell() // Ensure this function exists in your code
        }
    }
}

struct WOTabs_Component_Previews: PreviewProvider {
    static var previews: some View {
        WOTabsComponent()
    }
}
