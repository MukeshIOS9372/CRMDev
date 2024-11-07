//
//  ServiceAddressHeaderView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 04/11/24.
//

import SwiftUI

struct ServiceAddressHeaderView: View {
    
    @Binding var selectedTabName: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            // Top Row: Profile Image and User Info
            HStack(alignment: .top, spacing: 18 * iPadMultiplier) {
                // Profile with edit icon
                ProfileImageView(imageName: "preview_img", shape: .rectangular)

                VStack(alignment: .leading, spacing: 4 * iPadMultiplier) {
                    HStack(spacing: 10 * iPadMultiplier) {
                        Text("874 Hannah Ave")
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
//                        ic_map
                        Image("ic_map")
                            .foregroundColor(Color(hexString: "#3F464B"))
                            .font(.system(size: 18 * iPadMultiplier))
                        
//                        RoundedBorderChip(text: "Residential", color: Color(hexString: "#5ED5A8"))
                        
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
                    Text("Winter Park, FL  34747")
                        .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                        .foregroundColor(Color(hexString: "#656C73"))
                    HStack {
                        ContactOption(iconName: "justin_profile_icon", text: "Owner", rightIconName: "ic_down_dropdown",badgeNumber: 1, action: {
                            print("")
                        })
                        
                        ContactOption(iconName: "justin_profile_icon", text: "Tenant", rightIconName: "ic_down_dropdown",badgeNumber: 6, action: {
                            print("")
                        })
                        
                    }
                    .padding(.trailing, 14 * iPadMultiplier)
                    
                    HStack {
                        ServiceAddressNavigation(iconName: "ic_bed-fill", number: "2", isZellow: false)
                        ServiceAddressNavigation(iconName: "ic_light_nest-multi-room", number: "6", isZellow: false)
                        ServiceAddressNavigation(iconName: "ic_service_address_area", number: "4,245", isZellow: false)
                        ServiceAddressNavigation(iconName: "ic_zillow", number: "k", isZellow: true)
                    }
                }
            }
            

            MoreActionButtons(selectedTabName: $selectedTabName)

            AddActivityCommonView()
        }
    }
    
}


struct ServiceAddressHeaderContentView: View {
    var body: some View {
        @State var selectedTabName = "Timeline"
        ServiceAddressHeaderView(selectedTabName: $selectedTabName)
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ServiceAddress_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceAddressHeaderContentView()
            .previewDevice("iPhone 13 Pro")
        ServiceAddressHeaderContentView()
            .previewDevice("iPad Pro (12.9-inch)")
    }
}
