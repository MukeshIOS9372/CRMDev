//
//  BillingAddressTabComponent.swift
//  MY_Crm
//
//  Created by Mukesh Behera on 06/11/24.
//

import SwiftUI

struct BillingAddressTabComponent: View {
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
            BillingAddressListView()
        }
        .padding(12 * iPadMultiplier)
    }
}

struct BillingAddressTabComponent_Previews: PreviewProvider {
    static var previews: some View {
        BillingAddressTabComponent()
    }
}

