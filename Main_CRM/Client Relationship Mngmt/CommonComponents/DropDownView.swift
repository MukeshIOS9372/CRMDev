//
//  DropDownView.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

struct DropDownView: View {
    var imageName:String
    var title:String
    var shouldDisplayTitle:Bool = true
    var shouldDisplayDropDownArrow:Bool = true
    var headerType:HeaderType
    @Binding var name: HeaderType?
    @Binding var triggerChanges:Bool
    var body: some View {
        Button(action: {
            // Add the action you want to perform on tap here
            self.navigateToSheet()
        }) {
            HStack(spacing:5 * iPadMultiplier) {
                Image(imageName).resizable().frame(width: 15, height: 15)
                if shouldDisplayTitle {
                    Text(title).font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                }
                if shouldDisplayDropDownArrow {
                    Image("ic_down_dropdown").resizable().frame(width: 15, height: 15)
                }
            }.padding().background(Color.gray.opacity(0.1)).cornerRadius(10 * iPadMultiplier)
        }.buttonStyle(PlainButtonStyle())
    }
    
    func navigateToSheet(){
        name = headerType
        triggerChanges.toggle()
        switch headerType {
        case .calendar:
            name = .calendar
            print("calendar")
        case .sales:
            name = .sales
            print("sales")
        case .stageOptions:
            name = .stageOptions
            print("stageOptions")
        case .filter:
            name = .filter
            print("filter")
        }
        
    }
}

enum HeaderType:String{
    case calendar = "Calendar"
    case sales = "Sales"
    case stageOptions = "Stage Options"
    case filter = "Filter"
}

#Preview {
    DropDownView(imageName: "calendar", title: "All Time", headerType: HeaderType.calendar, name: .constant(.calendar), triggerChanges: .constant(false))
}
