//
//  ActionButton.swift
//  ClientRelationShip
//
//  Created by Mukesh Behera on 24/10/24.
//

import SwiftUI

struct MoreActionButtons: View {
    @Binding var selectedTabName: String
    var titleInitial: String
    
    var body: some View {
        
        HStack(spacing: 16 * iPadMultiplier) {
            Button(action: {
                // Action for New Estimate
            }) {
                HStack {
                    Text("\(titleInitial) \(selectedTabName)") // Text for the first button
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Blue_Color.rawValue))
                    Image(systemName: "plus") // Plus icon after the text
                        .foregroundColor(Color(App_Colors.App_Blue_Color.rawValue))
                }
                .padding(10 * iPadMultiplier)
                .frame(maxWidth: .infinity)
                .background(Color(App_Colors.App_Light_Blue_Color.rawValue))
                .cornerRadius(6 * iPadMultiplier)
            }
            .frame(height: 68 * iPadMultiplier)
            
            Button(action: {
                // Action for More Actions
            }) {
                HStack {
                    Text("More Actions") // Text for the first button
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                        .foregroundColor(.white)
                    Image(systemName: "chevron.down") // Plus icon after the text
                        .foregroundColor(.white)
                }
                .padding(10 * iPadMultiplier)
                .frame(maxWidth: .infinity)
                .background(Color(App_Colors.App_Blue_Color.rawValue))
                .cornerRadius(6 * iPadMultiplier)
                    
            }
            .frame(height: 68 * iPadMultiplier)
        }
        .padding(.horizontal, 12 * iPadMultiplier)
    }
}

struct MoreAction_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedTabName = "Timeline"
        MoreActionButtons(selectedTabName: $selectedTabName, titleInitial: "New")
    }
}
