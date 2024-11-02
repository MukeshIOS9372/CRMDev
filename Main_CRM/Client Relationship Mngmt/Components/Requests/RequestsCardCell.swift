//
//  RequestsCardCell.swift
//  CRM_New_Dev
//
//  Created by Mukesh Behera on 30/10/24.
//

import SwiftUI

struct RequestsCardCell: View {
    var body: some View {
        List() {
            // First item("ic_phone_icon", "+1 (859) 455 4874")
            CommonVerticleListCell(itemName: "RQ-000240", title: "Request For Assembly Of Times", status: "New", statusColor: "#5ED5A8", email: (imgName: "ic_mail_envelope", title: "example@mail.com"), phone: (imgName: "ic_phone_icon", title: "+1 (859) 455 4874"))
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(.bottom, 15 * iPadMultiplier)

            
            // Second item
            CommonVerticleListCell(itemName: "RQ-000726", title: "Pull Permits to ensure home meets local building codes", status: ">30 Days Old", statusColor: "#E74C3C", email: ("ic_mail_envelope", "example@mail.com"), phone: ("ic_phone_icon", "+1 (859) 455 4874"))
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(.bottom, 15 * iPadMultiplier)
        }
        .listStyle(PlainListStyle())
        .background(Color.white)
        
    }
}

struct RequestsCard_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsCardCell()
    }
}

