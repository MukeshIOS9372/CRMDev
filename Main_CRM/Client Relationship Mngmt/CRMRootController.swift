//
//  CRMRootController.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 24/10/24.
//

import SwiftUI

struct CRMRootController: View {
    @State private var selectedTab: Int = 0
    @State private var moreSelectedOption: String
    @State private var mainSelectedOption: String

    let mainTabs = [
        "Timeline",
        "Estimates",
        "Invoices"
    ]

    let moreOptions = [
        "Jobs",
        "Work Orders",
        "Requests",
        "Post Inspection",
        "Payments",
        "Shopping List"
    ]

    init() {
        _moreSelectedOption = State(initialValue: moreOptions.first!)
        _mainSelectedOption = State(initialValue: mainTabs.first!)
    }

    var body: some View {
        VStack(alignment: .center) {
            ServiceAddressHeaderView()

            // Scrollable Tab Bar with Centering on Selection
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16 * iPadMultiplier) {
                        // Main tabs
                        ForEach(0..<mainTabs.count, id: \.self) { index in
                            TabBarButton(title: mainTabs[index], isActive: selectedTab == index, showDropdownIcon: false) {
                                selectedTab = index
                                mainSelectedOption = mainTabs[index]

                                
                                // Scroll to the selected tab and center it
                                withAnimation {
                                    scrollViewProxy.scrollTo(index, anchor: .center)
                                }
                            }
                            .id(index)
                        }

                        if selectedTab < mainTabs.count {
                            TabBarButton(
                                title: moreSelectedOption,
                                isActive: selectedTab >= mainTabs.count,
                                showDropdownIcon: true
                            ) {
                                if selectedTab < mainTabs.count {
                                    // When "More" tab is not selected, just switch to the "More" tab
                                    selectedTab = mainTabs.count
                                }
                            }
                        } else {
                            Menu {
                                ForEach(moreOptions, id: \.self) { option in
                                    Button(action: {
                                        moreSelectedOption = option
                                        selectedTab = mainTabs.count + moreOptions.firstIndex(of: option)!
                                    }) {
                                        Text(option)
                                    }
                                }
                            } label: {
                                TabBarButton(
                                    title: moreSelectedOption,
                                    isActive: selectedTab >= mainTabs.count,
                                    showDropdownIcon: true
                                ) {
                                    if selectedTab < mainTabs.count {
                                        selectedTab = mainTabs.count
                                    }
                                }
                            }
                            .id(mainTabs.count)
                        }
                        // "More" Tab with Menu and Dropdown Icon
                        
                    }
                    .padding(.horizontal, 12 * iPadMultiplier)
                }
            }

            // Swipeable Tab Content
            TabView(selection: $selectedTab) {
                Text("Timeline Content").tag(0)
                EstimateTabComponent().tag(1)
                InvoiceTabComponent().tag(2)

                // Content for "More" options
                if moreSelectedOption == "Jobs" {
                    JobsTabsComponent().tag(mainTabs.count + 0)
                } else if moreSelectedOption == "Work Orders" {
                    WOTabsComponent().tag(mainTabs.count + 1)
                } else if moreSelectedOption == "Requests" {
                    RequestsTabsComponent().tag(mainTabs.count + 2)
                } else if moreSelectedOption == "Post Inspection" {
                    PITabsComponent().tag(mainTabs.count + 3)
                } else if moreSelectedOption == "Payments" {
                    PaymentTabsComponent().tag(mainTabs.count + 4)
                } else if moreSelectedOption == "Shopping List" {
                    ShoppingListTabsComponent().tag(mainTabs.count + 5)
                } else {
                    Text("Timeline Content").tag(0)
                    EstimateTabComponent().tag(1)
                    InvoiceTabComponent().tag(2)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct TabBarButton: View {
    var title: String
    var isActive: Bool
    var showDropdownIcon: Bool // New parameter for showing the dropdown icon
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                HStack {
                    Text(title)
                        .font(.system(size: 14 * iPadMultiplier))
                        .fontWeight(isActive ? .bold : .regular)
                        .foregroundColor(isActive ? Color(hexString: "#F21314") : Color(hexString: "#656C73"))

                    if showDropdownIcon {
                        Image(systemName: "chevron.down") // Dropdown icon for "More" tab
                            .font(.system(size: 12 * iPadMultiplier))
                            .foregroundColor(isActive ? Color(hexString: "#F21314") : Color(hexString: "#656C73"))
                    }
                }

                Rectangle()
                    .fill(isActive ? Color(hexString: "#F21314") : Color.clear)
                    .frame(height: 2 * iPadMultiplier)
            }
        }
    }
}

struct CRERootContentView: View {
    var body: some View {
        CRMRootController()
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
    }
}

struct CRERoot_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CRERootContentView()
            .previewDevice("iPhone 13 Pro")
        CRERootContentView()
            .previewDevice("iPad Pro (12.9-inch)")
    }
}
