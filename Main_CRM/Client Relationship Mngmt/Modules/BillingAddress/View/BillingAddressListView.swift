//
//  BillingAddressListView.swift
//  MY_Crm
//
//  Created by Mukesh Behera on 06/11/24.
//

import SwiftUI

struct BillingAddressListView: View {
    
    //    var verticleLists = [CommonVerticleListModel]()
    @StateObject private var viewModel = BillingAddressViewModel()
    
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
            
            //            ForEach(verticleLists, id: \.id) { item in
            let assignedMembersArr = [LimitedHorizontalListViewListItem(
                image: "preview_img",
                title: "Mukesh"
            ), LimitedHorizontalListViewListItem(
                image: "justin_profile_icon",
                title: "Robert D."
            )]
            
            CommonServiceAddressCell(imageName: "preview_img", title: "87038 Hannah Stravenue", address: "132/5 Main Street, South Roth, Arizona,  US,", horizontalMembers: [HorizontalMembersView(title: "Owner: ", membersArr: assignedMembersArr), HorizontalMembersView(title: "Tenant: ", membersArr: assignedMembersArr)])
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(.bottom, 15 * iPadMultiplier)
            //            }
            
        }
        .listStyle(PlainListStyle())
        .background(Color.white)
        
    }
}

struct BillingAddressList_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BillingAddressListView()
    }
}

