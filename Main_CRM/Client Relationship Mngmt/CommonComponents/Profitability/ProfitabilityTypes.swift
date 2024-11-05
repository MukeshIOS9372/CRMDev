//
//  ProfitabilityTypes.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 29/10/24.
//

import SwiftUI

struct GrossProfitCardView: View {
    var title: String?
    var amount: String?
    var percentage: String?
    var backgroundColor: Color = Color.green.opacity(0.1)
    var onSelect: (ProfitabilityItemType, ProfitabilityItemCellTapType) -> Void
    
    @State private var showTooltip = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
            // Title with clickable Info icon
            HStack(spacing: 4 * iPadMultiplier) {
                Circle()
                    .fill(Color(hexString: "#5ED5A8"))
                    .frame(width: 12 * iPadMultiplier, height: 12 * iPadMultiplier)
                Text(title ?? "")
                    .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#656C73"))
                    
                
                // Question mark icon with tooltip
                Button(action: {
                    showTooltip.toggle()
                }) {
                    Image(systemName: "questionmark.circle")
//                        .font(.caption2)
//                        .foregroundColor(.secondary)
                }
                .popover(isPresented: $showTooltip) {
                    Text("This is the gross profit after expenses.")
                        .padding()
                        .frame(maxWidth: 200 * iPadMultiplier)
                }
            }
            
            // Amount
            VStack(spacing: 4 * iPadMultiplier) {
                Text(amount ?? "")
                    .font(Font.custom(FontBook.Bold.rawValue, size: 18 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#3F464B"))
                
                Text(percentage ?? "")
                    .font(Font.custom(FontBook.Bold.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#3F464B"))
            }
//            .frame(maxWidth: .infinity)
        }
        .padding(8 * iPadMultiplier)
        .padding(.leading,22 * iPadMultiplier)
        .padding(.trailing,22 * iPadMultiplier)
        .background(backgroundColor)
        .cornerRadius(8 * iPadMultiplier)
        .frame(width: (UIScreen.main.bounds.width / 2) - 34)
        .onTapGesture {
            onSelect(.grossProfit, .cell)
        }
    }
}

struct GrossProfitCardView_Previews: PreviewProvider {
    static var previews: some View {
        GrossProfitCardView(title: "Gross Profit", amount: "$151,663.22", percentage: "35.65%", onSelect: {_,_  in 
            print("gross selected")
        })
        .previewLayout(.sizeThatFits)
        .padding()
    }
}


struct LineItemsView: View {
    var title: String
    var firstAmount: String
    var secondAmount: String
    var grossProfit: String
    var onSelect: (ProfitabilityItemType, ProfitabilityItemCellTapType) -> Void
    
    @State private var showTooltip = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Title with info icon
            HStack(spacing: 5 * iPadMultiplier) {
                Circle()
                    .fill(Color(hexString: "#3B82F6"))
                    .frame(width: 12 * iPadMultiplier, height: 12 * iPadMultiplier)
                Text(title)
                    .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#656C73"))
                
                // Question mark icon with tooltip
                Button(action: {
                    showTooltip.toggle()
                }) {
                    Image(systemName: "questionmark.circle")
//                        .font(.caption2)
                        .foregroundColor(Color(hexString: "#656C73"))
                }
                .popover(isPresented: $showTooltip) {
                    Text("This is the gross profit after expenses.")
                        .padding()
                        .frame(maxWidth: 200 * iPadMultiplier)
                }
            }
            
            // Amounts
            VStack(spacing: 4 * iPadMultiplier) {
                Text("\(firstAmount) - \(secondAmount)")
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#656C73"))
                
                // Gross Profit
                HStack(spacing: 4 * iPadMultiplier){
                    Text("\(grossProfit)")
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                        .foregroundColor(Color(hexString: "#5ED5A8"))
                    Text("Gross Profit")
                        .font(Font.custom(FontBook.Regular.rawValue, size: 10 * iPadMultiplier))
                        .foregroundColor(Color(hexString: "#656C73"))
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(10 * iPadMultiplier)
        .padding(.leading,6 * iPadMultiplier)
        .padding(.trailing,6 * iPadMultiplier)
        .background(Color(hexString: "#FAFAFA"))
        .cornerRadius(10 * iPadMultiplier)
//        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
        .frame(width: (UIScreen.main.bounds.width / 2) - 34)
        .onTapGesture {
            onSelect(.generalItem, .cell)
        }
    }
}

struct LineItemsContentView: View {
    var body: some View {
        LineItemsView(
            title: "Line Items",
            firstAmount: "$14,641.85",
            secondAmount: "$14,641.85",
            grossProfit: "$14,641.85", onSelect: {_,_  in 
                print("Line item selected")
            })
    }
}

struct LineItemsContentView_Previews: PreviewProvider {
    static var previews: some View {
        LineItemsContentView()
    }
}


struct CostsView: View {
    var title: String?
    var amount: String?
    var isShowEdit: Bool?
    var onSelect: (ProfitabilityItemType, ProfitabilityItemCellTapType) -> Void
    
    @State private var showTooltip = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
            // Title with info icon
            HStack(alignment: .top,spacing: 5 * iPadMultiplier) {
                Text(title ?? "")
                    .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#656C73"))
                
                // Question mark icon with tooltip
                Button(action: {
                    showTooltip.toggle()
                }) {
                    Image(systemName: "questionmark.circle")
//                        .font(.caption2)
                        .foregroundColor(Color(hexString: "#656C73"))
                }
                .popover(isPresented: $showTooltip) {
                    Text("This is the gross profit after expenses.")
                        .padding()
                        .frame(maxWidth: 200 * iPadMultiplier)
                }
                Spacer()
                if isShowEdit ?? false {
                    Button(action: {
                        onSelect(.itemCost, .edit)
                    }) {
                        Image("editInWhite")
                            .foregroundColor(Color(hexString: "#656C73"))
                    }
                    .frame(width: 18 * iPadMultiplier, height: 18 * iPadMultiplier, alignment: .trailing)
                }
            }
            
            // Amounts
            Text(amount ?? "")
                .font(Font.custom(FontBook.Semibold.rawValue, size: 14))
                .foregroundColor(Color(hexString: "#656C73"))
            
        }
        .padding(10 * iPadMultiplier)
        .padding(.leading,2 * iPadMultiplier)
        .padding(.trailing,2 * iPadMultiplier)
        .background(Color(hexString: "#FAFAFA"))
        .cornerRadius(10 * iPadMultiplier)
//        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
        .frame(width: (UIScreen.main.bounds.width / 2) - 34)
        .onTapGesture {
            onSelect(.itemCost, .cell)
        }
    }
}

struct CostsViewContentView: View {
    var body: some View {
        CostsView(
            title: "Material Cost",
            amount: "$14,641.85",
            isShowEdit: true, onSelect: {_,_  in 
                print("Material cost")
            })
//        .padding()
    }
}

struct CostsViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        CostsViewContentView()
    }
}

struct ProfitabilityItem: Decodable {
    let title: String
    let type: ProfitabilityItemType
    let grossProfitPercent: String
    let grossProfitAmount: String
    let rateAndCost: RateAndCost
    let toolTipText: String
    let isEditable: Bool
}

struct RateAndCost: Decodable {
    var rate: String
    var cost: String
}
