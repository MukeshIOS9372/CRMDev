//
//  ShowProfitabilityComponent.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 29/10/24.
//

import SwiftUI

struct ProfitabilityView: View {
    @State private var isExpanded = false
    var HideTitle:String = ""
    var showTitle:String = ""
   var expandedContent: AnyView?
    
    var body: some View {
//        if let itemsArr = profitabilityItemsArr {
            VStack(spacing: 8) {
                Button(action: {
//                    withAnimation {
                        isExpanded.toggle()
//                    }
                }) {
                    HStack {
                        Spacer()
                        Text(isExpanded ? HideTitle : showTitle)
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12))
                            .foregroundColor(Color(hexString: "#656C73"))
                        Image(isExpanded ? "ic_Up_dropdown" : "ic_down_dropdown")
                            .font(.subheadline)
                            .padding(.trailing, 8)
                            .foregroundColor(Color(hexString: "#656C73"))
                        Spacer()
                    }
                    .padding(6)
                    .background(Color(hexString: "#F0F0F0"))
                }
                
                if isExpanded {
                    // Horizontal ScrollView for content
                    expandedContent?.transition(.opacity)
                        .animation(.smooth, value: isExpanded)
                }
            }
            .padding(1)
            .background(Color(hexString: "#FAFAFA"))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(hexString: "#D2D4D6"), lineWidth: 1)
            )
            .cornerRadius(8)
//        }
    }
}
struct ProfitabilityContentView: View {
    var body: some View {

        let profitabilityArr = [
            ProfitabilityItem(title: "Gross Profit", type: .grossProfit, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
            ProfitabilityItem(title: "Line Items", type: .generalItem, grossProfitPercent: "$14,641.85", grossProfitAmount: "$151,663.22", rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
            ProfitabilityItem(title: "Material Cost", type: .itemCost, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: true)
        ]
        ProfitabilityView(HideTitle: "Hide Code",showTitle: "Show Code",expandedContent:AnyView(ServiceAddressCodeScrollView()))
    }
}

struct ProfitabilityView_Previews: PreviewProvider {
    static var previews: some View {
        ProfitabilityContentView()
            .previewLayout(.sizeThatFits)
    }
}
