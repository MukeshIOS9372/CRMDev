//
//  RequestsTabsComponent.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 30/10/24.
//

import SwiftUI

struct RequestsTabsComponent: View {
    @State private var isInsightsEnable = false
    
    var body: some View {
        VStack(alignment: .center) {
            if isInsightsEnable {
                ScrollableStatusCardsView(items: [
                    (title: "New", progress: 82, numerator: 2, denominator: 41),
                    (title: "Converted", progress: 50, numerator: 21, denominator: 41),
                    (title: "Scheduled", progress: 30, numerator: 12, denominator: 41),
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
            RequestsCardCell() // Ensure this function exists in your code
        }
    }
}

struct RequestsTabs_Component_Previews: PreviewProvider {
    static var previews: some View {
        RequestsTabsComponent()
    }
}
