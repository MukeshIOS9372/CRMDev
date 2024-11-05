//
//  EstimateCelll.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 28/10/24.
//

import SwiftUI

struct CommonVerticleListCell: View {
    
    let commonVerticleLists: CommonVerticleListModel?
    
    var body: some View {
        if let verticleLists = commonVerticleLists {
            VStack(spacing: 10 * iPadMultiplier) {
                if verticleLists.progress != nil {
                    GradientProgressBar(progress: verticleLists.progress ?? 0.0)
                }
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        if !verticleLists.itemName.isEmpty {
                            Text(verticleLists.itemName)
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                                .foregroundColor(Color(hexString: "#3B82F6"))
                            Spacer().frame(height: 10 * iPadMultiplier)
                        }
                        
                        if !verticleLists.title.isEmpty {
                            VStack(alignment: .leading, spacing: 5 * iPadMultiplier) {
                                Text(verticleLists.title)
                                    .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                                    .foregroundColor(Color(hexString: "#656C73"))
                                Spacer().frame(height: 5 * iPadMultiplier)
                            }
                        }
                        if let emailId = verticleLists.email {
                            EmailOrPhoneItemsRow(imageName: emailId.imgName, title: emailId.title)
                                .padding(.bottom,5 * iPadMultiplier)
                        }
                        if let phoneNumber = verticleLists.phone {
                            EmailOrPhoneItemsRow(imageName: phoneNumber.imgName, title: phoneNumber.title)
                        }
                        
                        
                        if let cartItemsCount = verticleLists.cartItemsCount {
                            CartItemsRow(cartItemsCount: cartItemsCount)
                            Spacer().frame(height: 5 * iPadMultiplier)
                        }
                        
                        AddressText(title: "At: ", address: verticleLists.address)
                        if !(verticleLists.category?.isEmpty ?? false) {
                            AddressText(title: "Category: ", address: verticleLists.category ?? "")
                        }
                        RelatedText(relatedTo: verticleLists.relatedTo, onTapRelatedTo: {
                            print("related tap..")
                        })
                        ScheduleText(schedule: verticleLists.schedule)
                        
                        if let client = verticleLists.client {
                            LimitedHorizontalListViewRow(
                                title: "Client:",
                                items: [
                                    LimitedHorizontalListViewListItem(
                                        image: client.imgName,
                                        title: client.title
                                    )
                                ]
                            )
                            .padding(.bottom, 5)
                        }
                        
                        if !((verticleLists.horizontalMembers?.count ?? 0) == 0) {
                            ForEach(0..<(verticleLists.horizontalMembers?.count ?? 0), id: \.self) { i in
                                LimitedHorizontalListViewRow(
                                    title: verticleLists.horizontalMembers?[i].title ?? "",
                                    items: verticleLists.horizontalMembers?[i].membersArr ?? [],
                                    visibleLimit: 1
                                )
                            }
                        }
                        
                        if verticleLists.paymentID != nil {
                            HStack{
                                Image("ic_bank")
                                    .foregroundColor(Color(hexString: "#656C73"))
                                Text("Bank")
                                    .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                                    .foregroundColor(Color(hexString: "#656C73"))
                                Image("solar_paperclip-bold")
                                    .foregroundColor(Color(hexString: "#656C73"))
                            }
                            
                            Text(verticleLists.paymentID ?? "")
                                .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                                .foregroundColor(Color(hexString: "#ADB1B5"))
                        }
                    }
                    //                .frame(maxHeight: .infinity) // Left VStack fills available height
                    Spacer()
                    VStack(alignment: .trailing) {
                        RoundedBorderChip(text: verticleLists.status ?? "", color: Color(hexString: verticleLists.statusColor ?? ""))
                        Spacer().frame(height: 20 * iPadMultiplier)
                        
                        if verticleLists.phases != nil || verticleLists.tasks != nil {
                            PhasesAndTasksRow(phases: verticleLists.phases, tasks: verticleLists.tasks)
                            //                        Spacer().frame(height: 20)
                        }
                        
                        Spacer()
                        
                        if !(verticleLists.email?.title ?? "").isEmpty {
                            Button(action: {
                                print("jsjs")
                            }) {
                                Image("ic_requests_arrow")
                                    .foregroundColor(Color(hexString: "#3B82F6"))
                                    .frame(width: 25 * iPadMultiplier, height: 25 * iPadMultiplier)
                            }
                        }
                        if verticleLists.isMessageShow {
                            ZStack{
                                Button(action: {
                                    print("message clicked")
                                }) {
                                    Image("message-circle-fill")
                                        .foregroundColor(Color(hexString: "#3B82F6"))
                                }
                                .frame(width: 22 * iPadMultiplier, height: 22 * iPadMultiplier, alignment: .trailing)
                                
                                if verticleLists.badgeCount > 0 {
                                    ZStack {
                                        Circle()
                                            .fill(Color(hexString: "#E74C3C"))
                                            .frame(width: 15 * iPadMultiplier, height: 15 * iPadMultiplier)
                                        
                                        Text("\(verticleLists.badgeCount > 9 ? "9+" : "\(verticleLists.badgeCount)")")
                                            .font(Font.custom(FontBook.Semibold.rawValue, size: 10 * iPadMultiplier))
                                            .foregroundColor(.white)
                                    }
                                    .offset(x: 12 * iPadMultiplier, y: -10 * iPadMultiplier) // Adjust position for the badge
                                }
                            }
                        }
                        // Place amount and time ago at the bottom
                        VStack(alignment: .trailing, spacing: 10 * iPadMultiplier) {
                            if !verticleLists.amount.isEmpty {
                                Text(verticleLists.amount)
                                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                    .foregroundColor(Color(hexString: "#3F464B"))
                                //                                .multilineTextAlignment(.trailing)
                                //                                .padding(.trailing)
                            }
                            
                            if !verticleLists.timeAgo.isEmpty {
                                Text(verticleLists.timeAgo)
                                    .font(Font.custom(FontBook.SemiboldIT.rawValue, size: 12 * iPadMultiplier))
                                    .foregroundColor(Color(hexString: "#ADB1B5"))
                                //                                .multilineTextAlignment(.trailing)
                                //                                .padding(.trailing)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                
                if (verticleLists.profitabilityArr?.count ?? 0) > 0 {
                    ProfitabilityView(profitabilityItemsArr: verticleLists.profitabilityArr) { itemType, actionType in
                        print(itemType)
                        print(actionType)
                    }
                }
            }
            .padding(.all, 10 * iPadMultiplier)
            .background(Color.white)
            .cornerRadius(8 * iPadMultiplier)
            .overlay(
                RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                    .stroke(Color(hexString: "#F0F0F0"), lineWidth: 1 * iPadMultiplier)
            )
        } else {
            Text("No Data Found")
        }
    }
}

struct CommonVerticleListCell_Previews: PreviewProvider {
    static var previews: some View {
        let listData = CommonVerticleListModel(id: "4", itemName: "EST- 00000212", title: "Ceiling Fan Recoiling Work", cartItemsCount: 2, relatedTo: "INV-000240", address: "123 Main Street, Texas 451245", schedule: "Nov. 4th, 2023 @12:45 PM", client: ContactInfo(imgName: "justin_profile_icon", title: "kskks"), horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: [
            LimitedHorizontalListViewListItem(
                image: "justin_profile_icon",
                title: "Mukesh"
            )
        ])], progress: 0.7, status: "Completed", statusColor: "#5ED5A8", phases: Phases(current: 3, total: 10), tasks: Tasks(completed: 5, total: 7), amount: "$300.00", timeAgo: "3 Months ago")
        CommonVerticleListCell(commonVerticleLists: listData)
    }
}


struct CartItemsRow: View {
    var cartItemsCount: Int
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            // Cart icon
            Image("ic_ion_cart") // Assuming the cart icon image name is "ic_cart" in assets
                .resizable()
                .frame(width: 14 * iPadMultiplier, height: 14 * iPadMultiplier)
                .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
            // Cart items count text
            Text("\(cartItemsCount) \(cartItemsCount > 1 ? "Items" : "Item")")
                .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                .foregroundColor(Color(hexString: "#656C73")) // Same color as icon
        }
    }
}

struct EmailOrPhoneItemsRow: View {
    var imageName: String
    var title: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            // Cart icon
            Image(imageName) // Assuming the cart icon image name is "ic_cart" in assets
                .resizable()
                .frame(width: 16 * iPadMultiplier, height: 16 * iPadMultiplier)
                .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
            // Cart items count text
            Text(title)
                .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier)) // Custom font, size 12
                .foregroundColor(Color(hexString: "#3B82F6")) // Same color as icon
        }
    }
}

struct RelatedText: View {
    var relatedTo: String
    var onTapRelatedTo: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 5 * iPadMultiplier) {
            if !relatedTo.isEmpty {
                Text("Related to: ")
                    .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#ADB1B5")) // Hex #ADB1B5
                +
                Text(relatedTo)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#3B82F6")) // Hex #3B82F6
                    .underline()
//                    .onTapGesture {
//                        onTapRelatedTo()
//                    }
                
                Spacer()
                    .frame(height: 5 * iPadMultiplier) // Spacer with 5-point height
            }
        }
    }
}

struct AddressText: View {
    var title: String
    var address: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5 * iPadMultiplier) {
            if !address.isEmpty {
                Text(title)
                    .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#ADB1B5")) // Hex #ADB1B5
                +
                Text(address)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
                
                Spacer()
                    .frame(height: 5 * iPadMultiplier) // Spacer with 5-point height
            }
        }
    }
}

struct ScheduleText: View {
    var schedule: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5 * iPadMultiplier) {
            if !schedule.isEmpty {
                Text("Schedule: ")
                    .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#ADB1B5")) // Hex #ADB1B5
                +
                Text(schedule)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#656C73")) // Hex #656C73
                Spacer()
                    .frame(height: 5 * iPadMultiplier) // Spacer with 5-point height
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
        HStack(alignment: .center, spacing: 4 * iPadMultiplier) { // Align items horizontally
            // Title text
            Text(title)
                .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                .foregroundColor(Color(hexString: "#ADB1B5")) // Hex #ADB1B5

            LimitedHorizontalListView(items: items, visibleLimit: visibleLimit)
        }
//        .modifier(modifier) // Apply any additional modifiers passed
    }
}

struct PhasesAndTasksRow: View {
    var phases: Phases?
    var tasks: Tasks?

    var body: some View {
        // Return EmptyView if both phases and tasks are nil
        if phases == nil && tasks == nil {
            return AnyView(EmptyView())
        } else {
            return AnyView(VStack(alignment: .trailing) {
                // Display phases if not nil
                if let phases = phases {
                    HStack(spacing: 1) {
                        Text("\(phases.current)")
                            .foregroundColor(Color(hexString: "#FF9800"))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))

                        Text("/\(phases.total)")
                            .foregroundColor(Color(hexString: "#ADB1B5"))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))

                        Text(" Phases")
                            .foregroundColor(Color(hexString: "#656C73"))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    }
                }

                // Display tasks if not nil
                if let tasks = tasks {
                    HStack(spacing: 1) {
                        Text("\(tasks.completed)")
                            .foregroundColor(Color(hexString: "#FF9800"))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))

                        Text("/\(tasks.total)")
                            .foregroundColor(Color(hexString: "#ADB1B5"))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))

                        Text(" Tasks")
                            .foregroundColor(Color(hexString: "#656C73"))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
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
            PhasesAndTasksRow(phases: Phases(current: 1, total: 2), tasks: Tasks(completed: 3, total: 4))
            PhasesAndTasksRow(phases: nil, tasks: nil) // Example with both nil
            PhasesAndTasksRow(phases: Phases(current: 1, total: 2), tasks: Tasks(completed: 3, total: 4)) // Example with only phases
            PhasesAndTasksRow(phases: nil, tasks: Tasks(completed: 3, total: 4)) // Example with only tasks
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HorizontalMembersView: Decodable {
    var title: String
    var membersArr: [LimitedHorizontalListViewListItem]
}


enum ProfitabilityItemType: Decodable {
    case grossProfit
    case generalItem
    case itemCost
}

// Enum for ProfitabilityItemCellTapType
enum ProfitabilityItemCellTapType {
    case edit
    case cell
}

