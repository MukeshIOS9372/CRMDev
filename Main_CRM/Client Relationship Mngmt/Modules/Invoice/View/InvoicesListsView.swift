//
//  InvoicesListsView.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 29/10/24.
//

import SwiftUI

struct InvoicesListsView: View {
    
    var verticleLists = [CommonVerticleListModel]()
    @StateObject private var viewModel = InvoiceViewModel()
    
    var body: some View {
//        VStack {
//            if viewModel.isLoading {
//                ProgressView("Loading...")
//            } else {
//                List(viewModel.items) { item in
//                    CommonVerticleListCell(commonVerticleLists: item)
//                    .listRowSeparator(.hidden)
//                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                    .padding(.bottom, 15 * iPadMultiplier)
//                }
//                .listStyle(PlainListStyle())
//                .background(Color.white)
//            }
//        }
//        .onAppear {
//            Task {
//                await viewModel.fetchItems()
//            }
//        }
//        .alert(isPresented: $viewModel.showAlert) {
//            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? "Unknown error"))
//        }
        
        List() {
            
            ForEach(verticleLists, id: \.id) { item in
                CommonVerticleListCell(commonVerticleLists: item)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(.bottom, 15 * iPadMultiplier)
            }
            
        }
        .listStyle(PlainListStyle())
        .background(Color.white)
        
    }
}

struct invoiceCard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let assignedMembersArr = [
            LimitedHorizontalListViewListItem(
                image: "justin_profile_icon",
                title: "Mukesh"
            )
        ]
        let profitabilityArr = [
            ProfitabilityItem(title: "Gross Profit", type: .grossProfit, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
            ProfitabilityItem(title: "Line Items", type: .generalItem, grossProfitPercent: "$14,641.85", grossProfitAmount: "$151,663.22", rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
            ProfitabilityItem(title: "Material Cost", type: .itemCost, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: RateAndCost(rate: "$14,641.85", cost: "$14,641.85"), toolTipText: "Click on tooltip", isEditable: true)]
        let verticleList = [CommonVerticleListModel(id: "1", itemName: "INV- 00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: assignedMembersArr)], status: "Overdue", statusColor: "#E74C3C", amount: "$300.00", timeAgo: "3 Months ago", profitabilityArr: profitabilityArr)]
        InvoicesListsView(verticleLists: verticleList)
    }
}

