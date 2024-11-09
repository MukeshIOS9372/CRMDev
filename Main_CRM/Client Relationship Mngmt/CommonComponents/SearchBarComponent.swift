//
//  SearchBarComponent.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 25/10/24.
//

import SwiftUI

struct Actionable {
    var isActive: Bool
    var assetName: String // Using a string for icon name in SwiftUI
    var actionableType: ActionableType
}
enum ActionableType {
    case insight, filter, menu
}
struct SearchAndFilters: View {
    var actions: [Actionable]
    @State var value: String = ""
    var placeholder: String = "Search Invoice No., Client Name"
    var onValueChange: (String) -> Void
    var onActionTap: (Actionable) -> Void
    var body: some View {
        
        HStack(alignment: .center) {
            // Search TextField
            TextField(
                placeholder,
                text: $value,
                onEditingChanged: { _ in onValueChange(value) }
            )
            .padding(15 * iPadMultiplier)
            .padding(.leading, 24 * iPadMultiplier)
            .background(RoundedRectangle(cornerRadius: 8 * iPadMultiplier).stroke((Color(hexString: "#ADB1B5")), lineWidth: 1 * iPadMultiplier))
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(hexString: "#656C73"))
                        .frame(width: 30 * iPadMultiplier, height: 30 * iPadMultiplier)
                        .padding(.leading, 5 * iPadMultiplier)
                    Spacer()
                }
            )
            .frame(height: 40 * iPadMultiplier) // Adjust as needed
            Spacer().frame(width: 15 * iPadMultiplier)
            // Actionable Buttons
            ForEach(actions, id: \.assetName) { action in
                ActionableButtonWithState(
                    iconName: action.assetName,
                    isActive: action.isActive,
                    type: action.actionableType,
                    onTap: {
                        onActionTap(action)
                    }
                )
                .padding(4 * iPadMultiplier)
            }
        }
        .padding(.leading, 5 * iPadMultiplier)
    }
}
// Helper component for Actionable Button
struct ActionableButtonWithState: View {
    var iconName: String
    var isActive: Bool
    var type: ActionableType
    var onTap: () -> Void
    var body: some View {
        
        Button(action: onTap) {
            Image(iconName)
                .resizable()
                .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                .foregroundColor(isActive ? (Color(hexString: "#3B82F6")) : (Color(hexString: "#656C73")))
                .padding(10 * iPadMultiplier)
        }
        .background(type == .menu ? Color.white : (isActive ? Color(hexString: "#DBEAFE") : Color(hexString: "#FAFAFA")))
        
        .cornerRadius(8 * iPadMultiplier)
        .overlay(
            RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                .stroke(type == .menu ? Color.white : (isActive ? Color(hexString: "#3B82F6") : Color(hexString: "#F0F0F0")), lineWidth: 1 * iPadMultiplier)
        )
    }
}

struct SearchBar_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndFilters(actions: [Actionable(isActive: false, assetName: "ic_filter", actionableType: .filter), Actionable(isActive: true, assetName: "ic_insights", actionableType: .insight)], onValueChange: { _ in }, onActionTap: {_ in
            print("")
        })
            .previewDevice("iPhone 13 Pro")
        SearchAndFilters(actions: [Actionable(isActive: true, assetName: "ic_filter", actionableType: .filter), Actionable(isActive: true, assetName: "ic_insights", actionableType: .insight)], onValueChange: { _ in }, onActionTap: {_ in
            print("")
        })
            .previewDevice("iPad Pro (12.9-inch)")
    }
}
