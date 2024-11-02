//
//  CRMRootController.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 24/10/24.
//

import SwiftUI

struct CRMRootController: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
       
        VStack(alignment: .center) {
            ClientRelationProfileHeader()
            // Scrollable Tab Bar
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16 * iPadMultiplier) {
                    ForEach(0..<5) { index in
                        TabBarButton(title: tabTitle(for: index), isActive: selectedTab == index) {
                            selectedTab = index
                        }
                    }
                }
                .padding(.horizontal, 12 * iPadMultiplier)
            }
            
            // Tab Content based on selected tab
            TabContent(selectedTab: selectedTab)
                .padding(.horizontal, 12 * iPadMultiplier)
                .padding(.top, 12 * iPadMultiplier)
        }
    }
    
    func tabTitle(for index: Int) -> String {
        switch index {
        case 0: return "Timeline"
        case 1: return "Estimates"
        case 2: return "Invoices"
        case 3: return "Jobs"
        case 4: return "Contacts"
        default: return ""
        }
    }
}

struct TabBarButton: View {
    var title: String
    var isActive: Bool
    var action: () -> Void

    var body: some View {
        
        Button(action: action) {
            VStack {
                Text(title)
                    .font(.system(size: 14 * iPadMultiplier))
                    .fontWeight(isActive ? .bold : .regular)
                    .foregroundColor(isActive ? .red : .gray)

                if isActive {
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 2 * iPadMultiplier)
                } else {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 2 * iPadMultiplier)
                }
            }
        }
    }
}


struct TabContent: View {
    var selectedTab: Int

    var body: some View {
        
        VStack {
            switch selectedTab {
            case 0:
                Text("Timeline Content")
//                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
            case 1:
                EstimateTabComponent()
            case 2:
                InvoiceTabComponent()
            case 3:
                JobsTabsComponent()
            case 4:
                Text("Contacts Content")
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
            default:
                Text("Unknown Tab")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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