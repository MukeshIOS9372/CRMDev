//
//  PipeLineView.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

struct PipeLineViewHeader: View {
    struct DropDownItem {
        let imageName: String
        let title: String
        let shouldDisplayTitle: Bool
        let shouldDisplayDropDownArrow: Bool
        let headerType: HeaderType
    }
    @Binding var name: HeaderType?
    @Binding var triggerChanges:Bool
    let topArrayView = [
        DropDownItem(imageName: "Calendar", title: "All Time", shouldDisplayTitle: true,shouldDisplayDropDownArrow: true,headerType: .calendar),
        DropDownItem(imageName: "mdi_pipe", title: "Sales", shouldDisplayTitle: true,shouldDisplayDropDownArrow: true,headerType: .sales),
        DropDownItem(imageName: "Stage Options", title: "", shouldDisplayTitle: false,shouldDisplayDropDownArrow: true,headerType: .stageOptions),
        DropDownItem(imageName: "ic_filter", title: "", shouldDisplayTitle: false,shouldDisplayDropDownArrow: false,headerType: .filter)
    ]
    var body: some View {
        HStack {
            ForEach(0..<topArrayView.count, id: \.self) { index in
                DropDownView(imageName: topArrayView[index].imageName, title: topArrayView[index].title, shouldDisplayTitle: topArrayView[index].shouldDisplayTitle,shouldDisplayDropDownArrow: topArrayView[index].shouldDisplayDropDownArrow,headerType:topArrayView[index].headerType, name: $name, triggerChanges: $triggerChanges )
            }
        }
        HorizontalLine()
        
        
    }
}

#Preview {
    PipeLineViewHeader(name:.constant(.calendar), triggerChanges: .constant(false))
}
