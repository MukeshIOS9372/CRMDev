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
            let profitabilityArr = [
                ProfitabilityItem(title: "Gross Profit", type: .grossProfit, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
                ProfitabilityItem(title: "Line Items", type: .generalItem, grossProfitPercent: "$14,641.85", grossProfitAmount: "$151,663.22", rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
                ProfitabilityItem(title: "Material Cost", type: .itemCost, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: true)
            ]
            // First item
            CommonVerticleListCell(itemName: "JOB- 00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245",schedule: "Nov. 4th, 2023 @12:45 PM", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("justin_profile_icon") // Ensure "img_user" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                                .clipShape(Circle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Mukesh")
                                .font(.custom("MyriadPro-Regular", size: 12 * iPadMultiplier))
                                .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                )
            ]), HorizontalMembersView(title: "Subs : ", membersArr: [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("justin_profile_icon") // Ensure "img_user" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                                .clipShape(Circle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Rands Mechanical LLC.")
                                .font(.custom("MyriadPro-Regular", size: 12 * iPadMultiplier))
                                .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                )
            ])],progress: 0.7, status: "Overdue", statusColor: "#E74C3C",phases: (6, 12),tasks: (2, 6), timeAgo: "3 Months ago", profitabilityArr: profitabilityArr, badgeCount: 12, isMessageShow: true)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(.bottom, 15 * iPadMultiplier)

            
            // Second item
            CommonVerticleListCell(itemName: "JOB- 00000212", title: "Ceiling Fan Recoiling Work", address: "123 Main Street, Texas 451245",schedule: "Nov. 4th, 2023 @12:45 PM", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("justin_profile_icon") // Ensure "img_user" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                                .clipShape(Circle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Mukesh")
                                .font(.custom("MyriadPro-Regular", size: 12 * iPadMultiplier))
                                .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                )
            ]), HorizontalMembersView(title: "Subs : ", membersArr: [
                LimitedHorizontalListViewListItem(
                    image: {
                        AnyView(
                            Image("justin_profile_icon") // Ensure "img_user" exists in assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                                .clipShape(Circle())
                        )
                    },
                    title: {
                        AnyView(
                            Text("Rands Mechanical LLC.")
                                .font(.custom("MyriadPro-Regular", size: 12 * iPadMultiplier))
                                .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
                                .fontWeight(.semibold)
                        )
                    }
                )
            ])],progress: 0.4, status: "Overdue", statusColor: "#E74C3C",phases: (6, 12),tasks: (2, 6), timeAgo: "3 Months ago", profitabilityArr: profitabilityArr, badgeCount: 12, isMessageShow: true)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(.bottom, 15 * iPadMultiplier)
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
