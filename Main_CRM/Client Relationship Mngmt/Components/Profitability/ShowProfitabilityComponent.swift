//
//  ShowProfitabilityComponent.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 29/10/24.
//

import SwiftUI

struct ProfitabilityView: View {
    @State private var isExpanded = false
    var profitabilityItemsArr: [ProfitabilityItem]?
    var onItemSelected: ((ProfitabilityItemType, ProfitabilityItemCellTapType?) -> Void)?
    
    
    var body: some View {
        if let itemsArr = profitabilityItemsArr {
            VStack(spacing: 8) {
                Button(action: {
//                    withAnimation {
                        isExpanded.toggle()
//                    }
                }) {
                    HStack {
                        Spacer()
                        Text(isExpanded ? "Hide Profitability" : "Show Profitability")
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
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            // Gross Profit
                            ForEach(itemsArr, id: \.title) { item in
                                if item.type == .grossProfit {
                                    GrossProfitCardView(title: item.title, amount: item.grossProfitAmount ?? "", percentage: item.grossProfitPercent ?? "", onSelect: { itemType,actionType in
                                        onItemSelected?(itemType, actionType)
                                    })
                                } else if item.type == .generalItem {
                                    // Line Items
                                    LineItemsView(
                                        title: item.title,
                                        firstAmount: item.rateAndCost?.0 ?? "",
                                        secondAmount: item.rateAndCost?.1 ?? "",
                                        grossProfit: item.grossProfitAmount ?? "", onSelect: { itemType,actionType in
                                            onItemSelected?(itemType, actionType)
                                        })
                                } else {
                                    CostsView(
                                        title: item.title,
                                        amount: item.grossProfitAmount,
                                        isShowEdit: item.isEditable, onSelect: { itemType,actionType  in
//                                            selectedItem = (itemType, actionType)
                                            onItemSelected?(itemType, actionType)
                                        })
                                }
                            }
                            
                        }
                        .padding(.leading, 4)
                        .padding(.trailing, 4)
                    }
//                    .transition(.opacity)
//                    .animation(.smooth, value: isExpanded)
                }
            }
            .padding(1)
            .background(Color(hexString: "#FAFAFA"))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(hexString: "#D2D4D6"), lineWidth: 1)
            )
            .cornerRadius(8)
        }
    }
}
struct ProfitabilityContentView: View {
    var body: some View {

        let profitabilityArr = [
            ProfitabilityItem(title: "Gross Profit", type: .grossProfit, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
            ProfitabilityItem(title: "Line Items", type: .generalItem, grossProfitPercent: "$14,641.85", grossProfitAmount: "$151,663.22", rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
            ProfitabilityItem(title: "Material Cost", type: .itemCost, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: true)
        ]
        ProfitabilityView(profitabilityItemsArr: profitabilityArr)
    }
}

struct ProfitabilityView_Previews: PreviewProvider {
    static var previews: some View {
        ProfitabilityContentView()
            .previewLayout(.sizeThatFits)
    }
}
