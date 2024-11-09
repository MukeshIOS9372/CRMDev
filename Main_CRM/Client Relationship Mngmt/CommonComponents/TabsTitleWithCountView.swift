//
//  TabsTitleWithCountView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 08/11/24.
//

import SwiftUI

struct TabsTitleWithCountView: View {
    var title: String
    var count: Int
//    var isShowInSights: Bool = false
//    var isShowMenu: Bool = false
    var onActionTap: (Actionable) -> Void
    var actions: [Actionable]
    
    var body: some View {
        VStack(spacing: 5) {
            HStack{
                Text("\(count) \(title)")
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 18 * iPadMultiplier))
                Spacer()
                
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
                
//                if isShowInSights {
//                    ActionableButtonWithState(
//                        iconName: "ic_insights",
//                        isActive: false,
//                        type: .insight,
//                        onTap: {
//                            onActionTap(action)
//                        }
//                    )
//                    .padding(.trailing, 10)
//                }
//                if isShowMenu {
//                    Button(action: {
//                        print("menu clicked")
//                    }) {
//                        HStack {
//                            // Icon (using system image or custom image)
//                            Image("menu-vertical-dots-black")
//                                .foregroundColor(Color(hexString: "#3F464B"))
//                                .font(.system(size: 18 * iPadMultiplier))
//                        }
//                        
//                    }
//                }
            }
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    TabsTitleWithCountView(title: "Estimates", count: 12, onActionTap: { _ in
        print("")
    }, actions: [Actionable(isActive: false, assetName: "ic_insights", actionableType: .insight), Actionable(isActive: false, assetName: "menu-vertical-dots-black", actionableType: .menu)])
    
    
}
