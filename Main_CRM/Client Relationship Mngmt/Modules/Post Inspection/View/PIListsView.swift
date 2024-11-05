//
//  PIListsView.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 02/11/24.
//

import SwiftUI

struct PIListsView: View {
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

struct PICard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let assignedMembersArr = [
            LimitedHorizontalListViewListItem(
                image: "justin_profile_icon",
                title: "Mukesh"
            )
        ]
        
        let verticleList = [CommonVerticleListModel(id: "2", itemName: "POI-0002154", title: "Ceiling Fan Recoiling Work",relatedTo: "EST - 000241", address: "123 Main Street, Texas 451245", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: assignedMembersArr)], status: "Overdue", statusColor: "#E74C3C", timeAgo: "3 Months ago")]
        PIListsView(verticleLists: verticleList)
    }
}
