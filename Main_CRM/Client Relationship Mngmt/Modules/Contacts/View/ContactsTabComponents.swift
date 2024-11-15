//
//  ContactsTabComponents.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 11/11/24.
//

import SwiftUI

struct ContactsTabComponents: View {
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
            ContactListView()
            
        }
        .padding(12 * iPadMultiplier)
    }
}

#Preview {
    ContactsTabComponents()
}
