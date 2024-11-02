//
//  JobsCardCell.swift
//  contractorplus
//
//  Created by Mukesh Behera on 30/10/24.
//  Copyright © 2024 ContractorPlus. All rights reserved.
//

import SwiftUI

struct JobsCardCell: View {
    var body: some View {
        
        
        List() {
            // First item
            CommonVerticleListCell(itemName: "JOB- 00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245",schedule: "Nov. 4th, 2023 @12:45 PM", assignedToMembers: ("Assigned To : ", [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("justin_profile_icon") // Ensure "img_user" exists in assets
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
            ]), subsOrgs: [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("master_card") // Ensure "img_user" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 20)
                                .clipShape(Rectangle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Rands Mechanical LLC.")
                                .font(.custom("MyriadPro-Regular", size: 12))
                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                ), LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("master_card") // Ensure "img_user" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 20)
                                .clipShape(Rectangle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Rands Mechanical LLC.")
                                .font(.custom("MyriadPro-Regular", size: 12))
                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                ), LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("master_card") // Ensure "img_user" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 20)
                                .clipShape(Rectangle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Rands Mechanical LLC.")
                                .font(.custom("MyriadPro-Regular", size: 12))
                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                )
            ],progress: 7.0, status: "Overdue", statusColor: "#E74C3C",phases: (6, 12),tasks: (2, 6), timeAgo: "3 Months ago", badgeCount: 12, isMessageShow: true)
//                .listRowSeparator(.hidden)
            .background(Color.white) // Match the background color to hide separators
            .listRowInsets(EdgeInsets())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(.bottom, 15)

            
            // Second item
            CommonVerticleListCell(itemName: "JOB- 00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245", assignedToMembers: ("Assigned To : ", [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("justin_profile_icon") // Ensure "img_user" exists in assets
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
            ]), status: "Paid", statusColor: "#5ED5A8", amount: "300.00", timeAgo: "3 Months ago", isMessageShow: true)
//                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(.bottom, 15)
        }
        .listStyle(PlainListStyle())
        .background(Color.white)
        
    }
}

struct JobsCard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JobsCardCell()
    }
}
