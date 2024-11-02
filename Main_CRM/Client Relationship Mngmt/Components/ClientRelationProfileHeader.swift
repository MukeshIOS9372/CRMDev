//
//  ClientRelationProfileHeader.swift
//  contractorplus
//
//  Created by Mukesh Behera on 23/10/24.
//  Copyright © 2024 ContractorPlus. All rights reserved.
//

import SwiftUI

struct ClientRelationProfileHeader: View {
    
    
    var body: some View {
        
        VStack(alignment: .center) {
            // Top Row: Profile Image and User Info
            HStack(alignment: .top, spacing: 18 * iPadMultiplier) {
                // Profile with edit icon
                ProfileImageView()

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
                        ContactOption(iconName: "ic_mail_gray", text: "Email", action: {
                            print("")
                        })
                        
                        ContactOption(iconName: "ic_phone_icon", text: "Phone", action: {
                            print("")
                        })
                        
                        ContactOption(iconName: "ic_social", text: "Social", action: {
                            print("")
                        })
                    }
                    .padding(.trailing, 14 * iPadMultiplier)
                    
                }
            }
            

            MoreActionButtons()

            // Buttons for Email, Phone, Social
            HStack(spacing: 20 * iPadMultiplier) {
                Text("Add Activity")
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                Spacer()
                Button(action: {
                    // Action for Email
                }) {
                    Image("ic_notepad")
                        .foregroundColor(Color(hexString: "#656C73"))
                }

                Button(action: {
                    // Action for Phone
                }) {
                    Image("ic_mail_envelope")
                        .foregroundColor(Color(hexString: "#656C73"))
                }

                Button(action: {
                    // Action for Social
                }) {
                    Image("ic_chat_icon")
                        .foregroundColor(Color(hexString: "#656C73"))
                }
                
                Button(action: {
                    // Action for More Actions
                }) {
                    HStack {
                        Image("ic_phone_icon").foregroundColor(Color(hexString: "#656C73"))
                        Image("ic_down_dropdown").foregroundColor(Color(hexString: "#656C73")) // Plus icon after the text
                    }
                    .padding(10 * iPadMultiplier)
                    .cornerRadius(6 * iPadMultiplier)
                        
                }
                .frame(height: 30 * iPadMultiplier)
                .background(
                    RoundedRectangle(cornerRadius: 12 * iPadMultiplier)
                        .fill(Color(hexString: "#FAFAFA"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5 * iPadMultiplier)
                                .stroke(Color(hexString: "#D2D4D6"), lineWidth: 1)
                        )
                )
            }
            .padding(.horizontal, 12 * iPadMultiplier)
            .padding(.bottom, 12 * iPadMultiplier)
        }
    }
    
}


struct ClientRelationContentView: View {
    var body: some View {
        ClientRelationProfileHeader()
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
