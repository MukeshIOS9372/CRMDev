//
//  PaymentsListsView.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 02/11/24.
//

import SwiftUI

struct PaymentsListsView: View {
    var verticleLists = [CommonVerticleListModel]()
    @StateObject private var viewModel = PaymentsViewModel()
    
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

struct PaymentsCard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let verticleList = [CommonVerticleListModel(id: "3", itemName: "$41,254.25", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245", status: "Overdue", statusColor: "#E74C3C", amount: "INV - 0002451", timeAgo: "3 Months ago", category: "Equipment Rental", paymentID: "q-154442584548848")]
        PaymentsListsView(verticleLists: verticleList)
    }
}
