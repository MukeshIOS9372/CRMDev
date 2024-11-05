//
//  ShoppingListListsView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 04/11/24.
//

import SwiftUI

struct ShoppingListListsView: View {
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

struct ShoppingListCard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let assignedMembersArr = [
            LimitedHorizontalListViewListItem(
                image: "justin_profile_icon",
                title: "Mukesh"
            ), LimitedHorizontalListViewListItem(
                image: "justin_profile_icon",
                title: "Mukesh"
            )
        ]
        let verticleList = [CommonVerticleListModel(id: "2", itemName: "$41,254.25", title: "Plumbing Items necessary*", cartItemsCount: 6, relatedTo: "EST - 000241", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: assignedMembersArr)], status: "In Progress", statusColor: "#FF9800", timeAgo: "3 Months ago")]
        ShoppingListListsView(verticleLists: verticleList)
    }
}
