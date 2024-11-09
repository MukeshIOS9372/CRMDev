//
//  JobsHeaderView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 08/11/24.
//

import SwiftUI

struct JobsHeaderView: View {
    
    @Binding var selectedTabName: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            // Top Row: Profile Image and User Info
            HStack(alignment: .top, spacing: 18 * iPadMultiplier) {
                // Profile with edit icon
                ProfileImageView(imageName: "preview_img", shape: .rectangular, isShowEdit: false)

                VStack(alignment: .leading, spacing: 4 * iPadMultiplier) {
                    HStack(spacing: 10 * iPadMultiplier) {
                        Text("Kitchen & Light Fixing")
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                        
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
                    VStack(alignment: .leading,spacing: 5) {
                        HStack(spacing: 5) {
                            ContactOption(iconName: "justin_profile_icon", text: "Client", rightIconName: "ic_down_dropdown", shape: .circular,badgeNumber: 1, action: {
                                print("")
                            })
                            
                            ContactOption(iconName: "justin_profile_icon", text: "Assigned", rightIconName: "ic_down_dropdown", shape: .circular,badgeNumber: 6, action: {
                                print("")
                            })
                            
                        }
                        .padding(.trailing, 14 * iPadMultiplier)
                        
                        HStack(spacing: 5) {
                            ContactOption(iconName: "preview_img", text: "Subs", rightIconName: "ic_down_dropdown", shape: .rectangular,badgeNumber: 6, action: {
                                print("")
                            })
                            
                            ContactOption(iconName: "justin_profile_icon", text: "Apr. 12th, 2024", shape: .circular,action: {
                                print("")
                            })
                            
                        }
                        .padding(.trailing, 14 * iPadMultiplier)
                    }
                    
                    
                }
            }
            

            MoreActionButtons(selectedTabName: $selectedTabName, titleInitial: "Add")

            AddActivityCommonView()
        }
    }
    
}


struct JobsHeaderContentView: View {
    var body: some View {
        @State var selectedTabName = "Timeline"
        JobsHeaderView(selectedTabName: $selectedTabName)
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
    }
}

struct JobsHeader_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JobsHeaderContentView()
            .previewDevice("iPhone 13 Pro")
        JobsHeaderContentView()
            .previewDevice("iPad Pro (12.9-inch)")
    }
}
