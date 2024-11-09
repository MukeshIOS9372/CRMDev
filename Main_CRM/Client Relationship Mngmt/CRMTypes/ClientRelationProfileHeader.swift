//
//  ClientRelationProfileHeader.swift
//  contractorplus
//
//  Created by Mukesh Behera on 23/10/24.
//  Copyright © 2024 ContractorPlus. All rights reserved.
//

import SwiftUI

struct ClientRelationProfileHeader: View {
    @Binding var selectedTabName: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            // Top Row: Profile Image and User Info
            HStack(alignment: .top, spacing: 18 * iPadMultiplier) {
                // Profile with edit icon
                ProfileImageView(imageName: "justin_profile_icon", shape: .circular)

                VStack(alignment: .leading, spacing: 20 * iPadMultiplier) {
                    HStack(spacing: 10 * iPadMultiplier) {
                        Text("Justin Smith")
                            .font(Font.custom(FontBook.BoldIT.rawValue, size: 20 * iPadMultiplier))
                        
                        RoundedBorderChip(text: "Residential", color: Color(hexString: "#5ED5A8"))
                        
                        Spacer()
                        
                        Button(action: {
                            print("menu clicked")
                        }) {
                            HStack {
                                // Icon (using system image or custom image)
                                Image("menu-vertical-dots-black")
                                    .foregroundColor(Color(hexString: "#3F464B"))
                                    .font(.system(size: 18 * iPadMultiplier))
                            }
                            
                        }
                        Spacer().frame(width: 12 * iPadMultiplier)
                    }
                    .padding(.top, 20 * iPadMultiplier)
                    
                    HStack {
                        ContactOption(iconName: "ic_mail_gray", text: "Email", rightIconName: "ic_down_dropdown", shape: .circular, action: {
                            print("")
                        })
                        
                        ContactOption(iconName: "ic_phone_icon", text: "Phone", rightIconName: "ic_down_dropdown", shape: .circular, action: {
                            print("")
                        })
                        
                        ContactOption(iconName: "ic_social", text: "Social", rightIconName: "ic_down_dropdown", shape: .circular, action: {
                            print("")
                        })
                    }
                    .padding(.trailing, 14 * iPadMultiplier)
                    
                }
            }
            

            MoreActionButtons(selectedTabName: $selectedTabName, titleInitial: "New")

            AddActivityCommonView()
        }
    }
    
}


struct ClientRelationContentView: View {
    var body: some View {
        @State var selectedTabName = "Timeline"
        ClientRelationProfileHeader(selectedTabName: $selectedTabName)
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ClientRelation_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClientRelationContentView()
            .previewDevice("iPhone 13 Pro")
        ClientRelationContentView()
            .previewDevice("iPad Pro (12.9-inch)")
    }
}
