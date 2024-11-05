//
//  RequestsListView.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 30/10/24.
//

import SwiftUI

struct RequestsListView: View {
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

struct RequestsCard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let verticleList = [CommonVerticleListModel(id: "2", itemName: "RQ-000240", title: "Request For Assembly Of Times", status: "New", statusColor: "#5ED5A8", email: ContactInfo(imgName: "ic_mail_envelope", title: "example@mail.com"), phone: ContactInfo(imgName: "ic_phone_icon", title: "+1 (859) 455 4874"))]
        RequestsListView(verticleLists: verticleList)
    }
}

