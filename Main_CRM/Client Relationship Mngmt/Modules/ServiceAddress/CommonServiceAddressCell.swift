//
//  CommonServiceAddressCell.swift
//  MY_Crm
//
//  Created by Mukesh Behera on 06/11/24.
//

import SwiftUI


struct ServiceAddressTab:View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ForEach(1...3, id: \.self) { index in
                    CommonServiceAddressCell()
                }
            }
        }
    }
}

struct CommonServiceAddressCell: View {
    

    var imageName: String?
    var title: String?
    var address: String?
    var horizontalMembers: [HorizontalMembersView]?
    var profitabilityArr: [ProfitabilityItem]?
    
    var body: some View {
        
        VStack{
            HStack(alignment: .top){
                
                Image(imageName ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 85 * iPadMultiplier, height: 62 * iPadMultiplier)
                    .clipShape(RoundedRectangle(cornerRadius: 8 * iPadMultiplier))
                    .overlay(RoundedRectangle(cornerRadius: 8 * iPadMultiplier).stroke(Color.white, lineWidth: 4 * iPadMultiplier))
                HStack(alignment: .top) {
                    VStack(alignment: .leading){
                        
                        Text(title ?? "")
                            .foregroundColor(Color(App_Colors.App_Blue_Color.rawValue))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                        Spacer().frame(height: 5)
                        Text(address ?? "")
                            .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                            .lineLimit(2)
                    }
                    Spacer()
                    
                    Button(action: {
                        print("menu clicked")
                    }) {
                        HStack {
                            Image("menu-vertical-dots-black")
                                .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
                                .font(.system(size: 18 * iPadMultiplier))
                        }
                        
                    }
                }
            }
            Spacer().frame(height: 15 * iPadMultiplier)
            if !((horizontalMembers?.count ?? 0) == 0) {
                ForEach(0..<(horizontalMembers?.count ?? 0), id: \.self) { i in
                    LimitedHorizontalListViewRow(
                        title: horizontalMembers?[i].title ?? "",
                        items: horizontalMembers?[i].membersArr ?? [],
                        visibleLimit: 1
                    )
                    .padding(.bottom,5 * iPadMultiplier)
                }
            }            
            
//            if (profitabilityArr?.count ?? 0) > 0 {
//                ProfitabilityView(HideTitle: "Hide Codes",showTitle: "Show Codes",expandedContent:AnyView(ServiceAddressCodeScrollView()))
//            }
            ProfitabilityView(HideTitle: "Hide Codes",showTitle: "Show Codes",expandedContent:AnyView(ServiceAddressCodeScrollView()))
            
        }
        .padding(.all, 10 * iPadMultiplier)
        .background(Color.white)
        .cornerRadius(8 * iPadMultiplier)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                .stroke(Color(App_Colors.App_White_Gray_Color.rawValue), lineWidth: 1 * iPadMultiplier)//"#3F464B"  "#F0F0F0"
        )
    }
}

#Preview {
    ServiceAddressTab()
    
}


struct ServiceAddressCodeScrollView:View{
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ShowCodeServiceAddress(heading: "Gate Code:", value: "AB391AC")
                ShowCodeServiceAddress(heading: "Lockbox:", value: "AB391AC")
            } // Sets max height to fill only the needed space
        }.frame(height: 50 * iPadMultiplier)
    }
}


struct ShowCodeServiceAddress: View {
    var heading: String
    var value: String
    
    var body: some View {
        VStack {
            Text(heading)
                .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
            Spacer().frame(height: 6 * iPadMultiplier)
            Text(value)
                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue)) // Hex #656C73
        }
        .frame(width: UIScreen.main.bounds.width / 2 - 20) // Half screen width minus padding
    }
}
