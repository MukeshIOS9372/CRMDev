//
//  ExpenseListsView.swift
//  MY_Crm
//
//  Created by Mukesh Behera on 06/11/24.
//

import SwiftUI


struct ExpenseListsView: View {
    
    var verticleLists = [CommonVerticleListModel]()
    @StateObject private var viewModel = ExpenseViewModel()
    
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

struct ExpenseLists_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let assignedMembersArr = [
            LimitedHorizontalListViewListItem(
                image: "justin_profile_icon",
                title: "Mukesh"
            )
        ]
        let verticleList = [CommonVerticleListModel(id: "3", itemName: "$41,254.25", title: "Ceiling Fan Recoiling Work", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: assignedMembersArr)], status: "Overdue", statusColor: "#E74C3C", timeAgo: "3 Months ago", category: Client(name: "Type: ", info: "Non-Reimbursable"), paymentID: "q-154442584548848")]

        ExpenseListsView(verticleLists: verticleList)
    }
}

