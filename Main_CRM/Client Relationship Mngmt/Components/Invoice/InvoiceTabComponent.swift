//
//  InvoiceTabComponent.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 29/10/24.
//

import SwiftUI

struct InvoiceTabComponent: View {
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
            invoiceCardCell() // Ensure this function exists in your code
        }
    }
}

struct InvoiceTabComponent_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceTabComponent()
    }
}
