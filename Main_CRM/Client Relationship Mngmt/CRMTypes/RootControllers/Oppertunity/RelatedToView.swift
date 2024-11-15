//
//  RelatedToView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 14/11/24.
//

import SwiftUI

struct RelatedToView: View {
    @State private var selectedRelation = ""
    @State private var relationValue = ""
    let deleteAction: () -> Void
    let relatedArr = ["Select Related To", "Estimate", "Invoice", "Job"]
    let jobsArr = ["JOB-000244", "JOB-000245", "JOB-000246"]
    
    init(deleteAction: @escaping () -> Void) {
        _selectedRelation = State(initialValue: relatedArr.first ?? "")
        self.deleteAction = deleteAction
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12 * iPadMultiplier) {
                DropdownPickerView(titleText: "Related To", leftIconName: "", menuOptionsArr: relatedArr, action: { optionName in
                    selectedRelation = optionName
                })
                if selectedRelation != relatedArr[0] {
                    DropdownPickerView(titleText: "Selected \(selectedRelation)", leftIconName: "ic_bag", menuOptionsArr: jobsArr, action: { optionName in
                        relationValue = optionName
                    })
                }
            }
            
            Button(action: deleteAction) {
                Image("ic_trash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                    .padding(.horizontal, 5 * iPadMultiplier)
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(15 * iPadMultiplier)
        .background(Color(App_Colors.App_White_Color.rawValue))
        .overlay(
            RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                .stroke(Color(App_Colors.App_White_Gray_Color.rawValue), lineWidth: 1 * iPadMultiplier)
        )
        
        
    }
}

struct RelatedToView_Previews: PreviewProvider {
    static var previews: some View {
        RelatedToView(deleteAction: {
            
        })
            .previewLayout(.sizeThatFits)
    }
}


struct DropdownPickerView: View {
    
    var titleText: String? = "Select Job"
    var leftIconName: String?
    var menuOptionsArr = [String]()
    @State private var selectedJob = ""
    let action: (String) -> Void
//    ["JOB-000244", "JOB-000245", "JOB-000246"]
    
    init(titleText: String? = "Select Job",
             isShowLeftIcon: Bool = false,
             leftIconName: String? = nil,
             menuOptionsArr: [String],
             action: @escaping (String) -> Void) {
            self.titleText = titleText
            self.leftIconName = leftIconName
            self.menuOptionsArr = menuOptionsArr
            self._selectedJob = State(initialValue: menuOptionsArr.first ?? "")
            self.action = action
        }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text(titleText ?? "")
                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
            
            Menu {
                ForEach(menuOptionsArr, id: \.self) { job in
                    Button(action: {
                        selectedJob = job
                        action(selectedJob)
                    }) {
                        Text(job)
                    }
                }
            } label: {
                HStack {
                    if !(leftIconName?.isEmpty ?? false) {
                        Image(leftIconName ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                            .padding(.horizontal, 5 * iPadMultiplier)
                            .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                    }
                    
                    Text(selectedJob)
                        .font(Font.custom(FontBook.Regular.rawValue, size: 16 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
                    
                    Spacer()
                    Image("ic_down_arror")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                }
                .padding(.horizontal)
                .padding(.vertical, 10 * iPadMultiplier)
                .background(
                    RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                        .stroke(Color(App_Colors.App_Light_Gray_Color_3.rawValue), lineWidth: 1 * iPadMultiplier)
                )
            }
            .background(Color(.white))
        }
        
    }
}

struct JobSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownPickerView(menuOptionsArr: [""], action: {_ in})
            .previewLayout(.sizeThatFits)
    }
}
