//
//  ServiceAddressRootController.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 08/11/24.
//

import SwiftUI

struct ServiceAddressRootController: View {
    @State private var selectedTab: Int = 0
    @State private var moreSelectedOption: String
    @ObservedObject var tabSelectionViewModel = TabSelectionViewModel()
    
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
        "Shopping List",
        "Expenses",
        "Service Addresses",
        "Billing Addresses"
    ]

    init() {
        _moreSelectedOption = State(initialValue: moreOptions.first!)
    }

    var body: some View {
        VStack(alignment: .center) {
            ServiceAddressHeaderView(selectedTabName: $tabSelectionViewModel.selectedTabName)

            // Scrollable Tab Bar with Centering on Selection
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16 * iPadMultiplier) {
                        // Main tabs
                        ForEach(0..<mainTabs.count, id: \.self) { index in
                            TabBarButton(title: mainTabs[index], isActive: selectedTab == index, showDropdownIcon: false) {
                                selectedTab = index
                                tabSelectionViewModel.selectedTabName = mainTabs[index]
                                
                                // Scroll to the selected tab and center it
                                withAnimation {
                                    scrollViewProxy.scrollTo(index, anchor: .center)
                                }
                            }
                            .id(index)
                        }

                        // "More" tab and menu for additional options
                        if selectedTab < mainTabs.count {
                            TabBarButton(
                                title: moreSelectedOption,
                                isActive: selectedTab >= mainTabs.count,
                                showDropdownIcon: true
                            ) {
                                selectedTab = mainTabs.count + (moreOptions.firstIndex(of: moreSelectedOption) ?? 0)
                            }
                        } else {
                            Menu {
                                ForEach(moreOptions, id: \.self) { option in
                                    Button(action: {
                                        moreSelectedOption = option
                                        tabSelectionViewModel.selectedTabName = option
                                        selectedTab = mainTabs.count + (moreOptions.firstIndex(of: option) ?? 0)
                                    }) {
                                        Label(option, systemImage: option == moreSelectedOption ? "checkmark" : "")
                                            .foregroundColor(option == moreSelectedOption ? Color.red : Color.blue)
                                    }
                                }
                            } label: {
                                TabBarButton(
                                    title: moreSelectedOption,
                                    isActive: selectedTab >= mainTabs.count,
                                    showDropdownIcon: true
                                ) {
                                    if selectedTab < mainTabs.count {
                                        selectedTab = mainTabs.count + moreOptions.firstIndex(of: moreSelectedOption)!
                                    }
                                }
                            }
                            .id(moreOptions.count)
                        }
                    }
                    .padding(.horizontal, 12 * iPadMultiplier)
                }
            }

            // Swipeable Tab Content
            TabView(selection: $selectedTab) {
                Text("Timeline Content").tag(0)
                    .onAppear { tabSelectionViewModel.selectedTabName = "Timeline" }
                EstimateTabComponent().tag(1)
                    .onAppear { tabSelectionViewModel.selectedTabName = "Estimates" }
                InvoiceTabComponent().tag(2)
                    .onAppear { tabSelectionViewModel.selectedTabName = "Invoices" }

                // Display content based on moreSelectedOption
                ForEach(moreOptions.indices, id: \.self) { index in
                    Group {
                        switch moreOptions[index] {
                        case "Jobs":
                            JobsTabsComponent()
                        case "Work Orders":
                            WOTabsComponent()
                        case "Requests":
                            RequestsTabsComponent()
                        case "Post Inspection":
                            PITabsComponent()
                        case "Payments":
                            PaymentTabsComponent()
                        case "Shopping List":
                            ShoppingListTabsComponent()
                        case "Expenses":
                            ExpenseTabsComponent()
                        case "Service Addresses":
                            ServiceAddressTabComponent()
                        case "Billing Addresses":
                            BillingAddressTabComponent()
                        default:
                            EmptyView()
                        }
                    }
                    .tag(mainTabs.count + index)
                    .onAppear {
                        tabSelectionViewModel.selectedTabName = moreOptions[index] // Update tab name for "more" options
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            // Ensure `selectedTab` aligns with `moreSelectedOption`
            if selectedTab >= mainTabs.count {
                selectedTab = mainTabs.count + moreOptions.firstIndex(of: moreSelectedOption)!
            }
        }
    }
}


struct ServiceAddressRootContentView: View {
    var body: some View {
        CRMRootController()
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ServiceAddressRoot_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CRERootContentView()
            .previewDevice("iPhone 13 Pro")
        CRERootContentView()
            .previewDevice("iPad Pro (12.9-inch)")
    }
}
