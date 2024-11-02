//
//  EstimateCardCell.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 25/10/24.
//

import SwiftUI

struct EstimateCardCell: View {
    init() {
        // Remove separators for all lists in this view
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List {
            // First item
            CommonVerticleListCell(itemName: "EST- 00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245", assignedToMembers: ("Assigned To : ", [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("justin_profile_icon") // Ensure "muk" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Mukesh")
                                .font(.custom("MyriadPro-Regular", size: 12))
                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                )
            ]), status: "Approved", statusColor: "#5ED5A8", amount: "300.00", timeAgo: "3 Months ago")
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(.bottom, 15)
            
            // Second item
            CommonVerticleListCell(itemName: "EST- 00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245", assignedToMembers: ("Assigned To : ", [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("justin_profile_icon") // Ensure "muk" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Mukesh")
                                .font(.custom("MyriadPro-Regular", size: 12))
                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                )
            ]), status: "Rejected", statusColor: "#E74C3C", amount: "300.00", timeAgo: "3 Months ago")
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(.bottom, 15)
        }
        .listStyle(PlainListStyle())
        .padding(.top, 15) // Optional: Padding around the List to avoid clipping
    }
}

struct EstimateCardCell_Previews: PreviewProvider {
    static var previews: some View {
        EstimateCardCell()
    }
}
