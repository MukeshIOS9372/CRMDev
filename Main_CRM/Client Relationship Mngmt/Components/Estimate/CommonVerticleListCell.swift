//
//  EstimateCelll.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 28/10/24.
//

import SwiftUI

struct CommonVerticleListCell: View {
    var itemName: String = ""
    var title: String = ""
    var cartItemsCount: Int?
    var relatedTo: String = ""
    var address: String = ""
    var schedule: String = ""
    var client: (String, String)?
    var assignedToMembers: (String, [LimitedHorizontalListViewListItem])?
    var subsOrgs: [LimitedHorizontalListViewListItem] = []
    var progress: Float?
    var status: String?
    var statusColor: String?
    var phases: (Int, Int)?
    var tasks: (Int, Int)?
    var amount: String = ""
    var timeAgo: String = ""
    var badgeCount: Int = 0
    var isMessageShow: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            if progress != nil {
                GradientProgressBar(progress: progress ?? 0.0)
            }
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    if !itemName.isEmpty {
                        Text(itemName)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(Color(red: 0.23, green: 0.51, blue: 0.96))
                        Spacer().frame(height: 10)
                    }
                    
                    if !title.isEmpty {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(title)
                                .font(.custom("MyriadPro-Regular", size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451))
                            Spacer().frame(height: 5)
                        }
                    }
                    
                    if let cartItemsCount = cartItemsCount {
                        CartItemsRow(cartItemsCount: cartItemsCount)
                        Spacer().frame(height: 5)
                    }
                    
                    RelatedText(relatedTo: relatedTo, onTapRelatedTo: {
                        print("related tap..")
                    })
                    
                    AddressText(address: address)
                    ScheduleText(schedule: schedule)
                    
                    if let client = client {
                        LimitedHorizontalListViewRow(
                            title: "Client:",
                            items: [
                                LimitedHorizontalListViewListItem(
                                    image: {
                                        AnyView(
                                            Image(client.0)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 20, height: 20)
                                                .clipShape(Circle())
                                        )
                                    },
                                    title: {
                                        AnyView(
                                            Text(client.1)
                                                .font(.custom("MyriadPro-Regular", size: 12))
                                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451))
                                                .fontWeight(.semibold)
                                        )
                                    }
                                )
                            ]
                        )
                        .padding(.bottom, 5)
                    }
                    
                    if !(assignedToMembers?.1.isEmpty ?? false) {
                        LimitedHorizontalListViewRow(
                            title: assignedToMembers?.0 ?? "",
                            items: assignedToMembers?.1 ?? [],
                            visibleLimit: 2
                        )
                    }
                    
                    if !subsOrgs.isEmpty {
                        LimitedHorizontalListViewRow(
                            title: "Subs : ",
                            items: subsOrgs,
                            visibleLimit: 1
                        )
                    }
                }
                .frame(maxHeight: .infinity) // Left VStack fills available height
                
                VStack(alignment: .trailing) {
                    RoundedBorderChip(text: status ?? "", color: Color(hexString: statusColor ?? ""))
                    Spacer().frame(height: 20)
                    
                    if phases != nil || tasks != nil {
                        PhasesAndTasksRow(phases: phases, tasks: tasks)
//                        Spacer().frame(height: 20)
                    }
                    
                    Spacer()
                    if isMessageShow {
                        ZStack{
                            Button(action: {
                                print("message clicked")
                            }) {
                                Image("message-circle-fill")
                                    .foregroundColor(Color.blue)
                            }
                            .frame(width: 22, height: 22, alignment: .trailing)
                            
                            if badgeCount > 0 {
                                ZStack {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 15, height: 15)
                                    
                                    Text("\(badgeCount > 9 ? "9+" : "\(badgeCount)")")
                                        .font(Font.custom(FontBook.Semibold.rawValue, size: 10 * iPadMultiplier))
                                        .foregroundColor(.white)
                                }
                                .offset(x: 12, y: -10) // Adjust position for the badge
                            }
                        }
                    }
                    // Place amount and time ago at the bottom
                    VStack(alignment: .trailing, spacing: 10) {
                        if !amount.isEmpty {
                            Text("$\(amount)")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hexString: "#3F464B"))
//                                .multilineTextAlignment(.trailing)
//                                .padding(.trailing)
                        }
                        
                        if !timeAgo.isEmpty {
                            Text(timeAgo)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                                .italic()
                                .foregroundColor(Color(hexString: "#ADB1B5"))
//                                .multilineTextAlignment(.trailing)
//                                .padding(.trailing)
                        }
                    }
//                    .padding()
                }
                .frame(maxHeight: .infinity)
            }
            let profitabilityArr = [
                ProfitabilityItem(title: "Gross Profit", type: .grossProfit, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
                ProfitabilityItem(title: "Line Items", type: .generalItem, grossProfitPercent: "$14,641.85", grossProfitAmount: "$151,663.22", rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: false),
                ProfitabilityItem(title: "Material Cost", type: .itemCost, grossProfitPercent: "35.65%", grossProfitAmount: "$151,663.22",rateAndCost: ("$14,641.85", "$14,641.85"), toolTipText: "Click on tooltip", isEditable: true)
            ]
            
            ProfitabilityView(profitabilityItemsArr: profitabilityArr) { itemType, actionType in
                print(itemType)
                print(actionType)
            }
            
        }
        .padding(.all, 10)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 0.941, green: 0.941, blue: 0.941), lineWidth: 1)
        )
    }
}


#Preview {
    CommonVerticleListCell(itemName: "EST- 00000212", title: "Ceiling Fan Recoiling Work", cartItemsCount: 2, relatedTo: "INV-000240", address: "123 Main Street, Texas 451245", schedule: "Nov. 4th, 2023 @12:45 PM", client: ("justin_profile_icon", "jsnj"), assignedToMembers: ("Assigned To : ", [
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
    ]), progress: 0.7, status: "Completed", statusColor: "#5ED5A8", phases: (3, 10), tasks: (5, 7), amount: "300.00", timeAgo: "3 Months ago")
}

struct CartItemsRow: View {
    var cartItemsCount: Int
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            // Cart icon
            Image("ic_ion_cart") // Assuming the cart icon image name is "ic_cart" in assets
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
            // Cart items count text
            Text("\(cartItemsCount) \(cartItemsCount > 1 ? "Items" : "Item")")
                .font(.custom("MyriadPro-Regular", size: 12)) // Custom font, size 12
                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Same color as icon
                .fontWeight(.regular) // Weight 400 equivalent
        }
    }
}

struct RelatedText: View {
    var relatedTo: String
    var onTapRelatedTo: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if !relatedTo.isEmpty {
                Text("Related to: ")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5
                +
                Text(relatedTo)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color(red: 0.231, green: 0.510, blue: 0.965)) // Hex #3B82F6
                    .underline()
//                    .onTapGesture {
//                        onTapRelatedTo()
//                    }
                
                Spacer()
                    .frame(height: 5) // Spacer with 5-point height
            }
        }
    }
}

struct AddressText: View {
    var address: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if !address.isEmpty {
                Text("At: ")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5
                +
                Text(address)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                
                Spacer()
                    .frame(height: 5) // Spacer with 5-point height
            }
        }
    }
}

struct ScheduleText: View {
    var schedule: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if !schedule.isEmpty {
                Text("Schedule: ")
                    .font(.custom("MyriadPro-Regular", size: 12))
                    .foregroundColor(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5
                +
                Text(schedule)
                    .font(.custom("MyriadPro-Regular", size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                Spacer()
                    .frame(height: 5) // Spacer with 5-point height
            }
        }
    }
}

struct LimitedHorizontalListViewRow: View {
//    var modifier: some ViewModifier = Modifier() // Default modifier
    var title: String
    var items: [LimitedHorizontalListViewListItem]
    var visibleLimit: Int = 2

    var body: some View {
        HStack(alignment: .center, spacing: 4) { // Align items horizontally
            // Title text
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5
                .fontWeight(.regular)

            LimitedHorizontalListView(items: items, visibleLimit: visibleLimit)
        }
//        .modifier(modifier) // Apply any additional modifiers passed
    }
}

struct PhasesAndTasksRow: View {
    var phases: (Int, Int)?
    var tasks: (Int, Int)?

    var body: some View {
        // Return EmptyView if both phases and tasks are nil
        if phases == nil && tasks == nil {
            return AnyView(EmptyView())
        } else {
            return AnyView(VStack(alignment: .trailing) {
                // Display phases if not nil
                if let phases = phases {
                    HStack(spacing: 1) {
                        Text("\(phases.0)")
                            .foregroundColor(Color.orange)
                            .font(.system(size: 12, weight: .semibold))

                        Text("/\(phases.1)")
                            .foregroundColor(Color.gray.opacity(0.7))
                            .font(.system(size: 12, weight: .semibold))

                        Text(" Phases")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.system(size: 12, weight: .semibold))
                    }
                }

                // Display tasks if not nil
                if let tasks = tasks {
                    HStack(spacing: 1) {
                        Text("\(tasks.0)")
                            .foregroundColor(Color.orange)
                            .font(.system(size: 12, weight: .semibold))

                        Text("/\(tasks.1)")
                            .foregroundColor(Color.gray.opacity(0.7))
                            .font(.system(size: 12, weight: .semibold))

                        Text(" Tasks")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.system(size: 12, weight: .semibold))
                    }
                }
            })
            .multilineTextAlignment(.trailing)
        }
    }
}

// Example ContentView for testing
struct ContentView: View {
    var body: some View {
        List {
            PhasesAndTasksRow(phases: (1, 2), tasks: (3, 4))
            PhasesAndTasksRow(phases: nil, tasks: nil) // Example with both nil
            PhasesAndTasksRow(phases: (5, 6), tasks: nil) // Example with only phases
            PhasesAndTasksRow(phases: nil, tasks: (7, 8)) // Example with only tasks
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



enum ProfitabilityItemType {
    case grossProfit
    case generalItem
    case itemCost
}

// Enum for ProfitabilityItemCellTapType
enum ProfitabilityItemCellTapType {
    case edit
    case cell
}

