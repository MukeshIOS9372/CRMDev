//
//  PICardCell.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 02/11/24.
//

import SwiftUI

struct PICardCell: View {
    var body: some View {
        List() {
            // First item
            CommonVerticleListCell(itemName: "POI-0002154", title: "Ceiling Fan Recoiling Work",relatedTo: "EST - 000241", address: "123 Main Street, Texas 451245", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: [
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
            ])], status: "Overdue", statusColor: "#E74C3C", timeAgo: "3 Months ago")
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(.bottom, 15 * iPadMultiplier)

            
            // Second item
            CommonVerticleListCell(itemName: "POI-0002154", title: "Ceiling Fan Recoiling Work",relatedTo: "EST - 000241", address: "123 Main Street, Texas 451245", horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: [
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
            ]), HorizontalMembersView(title: "Created By ~ ", membersArr: [
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
            ])], status: "Overdue", statusColor: "#E74C3C")
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .padding(.bottom, 15 * iPadMultiplier)
        }
        .listStyle(PlainListStyle())
        .background(Color.white)
        
    }
}

struct PICard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PICardCell()
    }
}
