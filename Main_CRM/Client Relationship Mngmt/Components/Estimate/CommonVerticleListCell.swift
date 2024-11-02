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
    var horizontalMembers: [HorizontalMembersView]?
    var progress: Float?
    var status: String?
    var statusColor: String?
    var phases: (Int, Int)?
    var tasks: (Int, Int)?
    var amount: String = ""
    var timeAgo: String = ""
    var profitabilityArr: [ProfitabilityItem]?
    var email: (imgName: String, title: String)?
    var phone: (imgName: String, title: String)?
    var category: String?
    
    var body: some View {
        VStack(spacing: 10) {
            if progress != nil {
                GradientProgressBar(progress: progress ?? 0.0)
            }
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    if !itemName.isEmpty {
                        Text(itemName)
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                            .foregroundColor(Color(red: 0.23, green: 0.51, blue: 0.96))
                        Spacer().frame(height: 10)
                    }
                    
                    if !title.isEmpty {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(title)
                                .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451))
                            Spacer().frame(height: 5)
                        }
                    }
                    if let emailId = email {
                        EmailOrPhoneItemsRow(imageName: emailId.0, title: emailId.1)
                            .padding(.bottom,5)
                    }
                    if let phoneNumber = phone {
                        EmailOrPhoneItemsRow(imageName: phoneNumber.0, title: phoneNumber.1)
                    }

                    
                    if let cartItemsCount = cartItemsCount {
                        CartItemsRow(cartItemsCount: cartItemsCount)
                        Spacer().frame(height: 5)
                    }
                    
                    AddressText(title: "At: ", address: address)
                    if !(category?.isEmpty ?? false) {
                        AddressText(title: "Category: ", address: category ?? "")
                    }
                    RelatedText(relatedTo: relatedTo, onTapRelatedTo: {
                        print("related tap..")
                    })                    
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
                                                .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                                                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451))
                                                .fontWeight(.semibold)
                                        )
                                    }
                                )
                            ]
                        )
                        .padding(.bottom, 5)
                    }
                    
                    if !((horizontalMembers?.count ?? 0) == 0) {
                        ForEach(0..<(horizontalMembers?.count ?? 0), id: \.self) { i in
                            LimitedHorizontalListViewRow(
                                title: horizontalMembers?[i].title ?? "",
                                items: horizontalMembers?[i].membersArr ?? [],
                                visibleLimit: 1
                            )
                        }
                    }
                }
//                .frame(maxHeight: .infinity) // Left VStack fills available height
                Spacer()
                VStack(alignment: .trailing) {
                    RoundedBorderChip(text: status ?? "", color: Color(hexString: statusColor ?? ""))
                    Spacer().frame(height: 20)
                    
                    if phases != nil || tasks != nil {
                        PhasesAndTasksRow(phases: phases, tasks: tasks)
//                        Spacer().frame(height: 20)
                    }
                    
                    Spacer()
                    
                    if !(email?.1 ?? "").isEmpty {
                        Button(action: {
                            print("jsjs")
                        }) {
                            Image("ic_requests_arrow")
                                .foregroundColor(Color(hexString: "#3B82F6"))
                                .frame(width: 25, height: 25)
                        }
                    }
                    
                    // Place amount and time ago at the bottom
                    VStack(alignment: .trailing, spacing: 10) {
                        if !amount.isEmpty {
                            Text(amount)
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                .foregroundColor(Color(hexString: "#3F464B"))
//                                .multilineTextAlignment(.trailing)
//                                .padding(.trailing)
                        }
                        
                        if !timeAgo.isEmpty {
                            Text(timeAgo)
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                                .italic()
                                .foregroundColor(Color(hexString: "#ADB1B5"))
//                                .multilineTextAlignment(.trailing)
//                                .padding(.trailing)
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }
            
            if (profitabilityArr?.count ?? 0) > 0 {
                ProfitabilityView(profitabilityItemsArr: profitabilityArr) { itemType, actionType in
                    print(itemType)
                    print(actionType)
                }
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

struct CommonVerticleListCell_Previews: PreviewProvider {
    static var previews: some View {
        CommonVerticleListCell(itemName: "EST- 00000212", title: "Ceiling Fan Recoiling Work", cartItemsCount: 2, relatedTo: "INV-000240", address: "123 Main Street, Texas 451245", schedule: "Nov. 4th, 2023 @12:45 PM", client: ("justin_profile_icon", "jsnj"), horizontalMembers: [HorizontalMembersView(title: "Assigned To : ", membersArr: [
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
                            .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                            .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
                            .fontWeight(.semibold)
                    )
                }
            )
        ])], progress: 0.7, status: "Completed", statusColor: "#5ED5A8", phases: (3, 10), tasks: (5, 7), amount: "$300.00", timeAgo: "3 Months ago")
    }
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
                .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Same color as icon
                .fontWeight(.regular) // Weight 400 equivalent
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
                .frame(width: 16, height: 16)
                .foregroundColor(Color(red: 0.396, green: 0.424, blue: 0.451)) // Hex #656C73
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
        VStack(alignment: .leading, spacing: 5) {
            if !relatedTo.isEmpty {
                Text("Related to: ")
                    .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5
                +
                Text(relatedTo)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
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
    var title: String
    var address: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if !address.isEmpty {
                Text(title)
                    .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5
                +
                Text(address)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
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
                    .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5
                +
                Text(schedule)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
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
                .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                .foregroundColor(Color(red: 0.678, green: 0.694, blue: 0.710)) // Hex #ADB1B5

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
                    HStack {
                        Text("\(phases.0)")
                            .foregroundColor(Color.orange)
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))

                        Text("/\(phases.1)")
                            .foregroundColor(Color.gray.opacity(0.7))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))

                        Text(" Phases")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    }
                }

                // Display tasks if not nil
                if let tasks = tasks {
                    HStack {
                        Text("\(tasks.0)")
                            .foregroundColor(Color.orange)
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))

                        Text("/\(tasks.1)")
                            .foregroundColor(Color.gray.opacity(0.7))
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))

                        Text(" Tasks")
                            .foregroundColor(Color.gray.opacity(0.5))
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

struct HorizontalMembersView {
    var title: String?
    var membersArr: [LimitedHorizontalListViewListItem]?
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

