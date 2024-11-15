//
//  SelectPipelinePopUpView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 15/11/24.
//

import SwiftUI

struct SelectPipelineView: View {
    @State var value: String = ""
    @State private var isSelected: Bool = false
    @State private var SelectedName = ""
    var pipelineArr = ["Sales", "Demo Done", "Estimate Done"]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(spacing: 2 * iPadMultiplier) {
                    Text("Select Pipeline")
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 18 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                    Spacer()
                }
                .padding(.bottom, 20 * iPadMultiplier)
                HStack {
                    Image("ic_search")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                        .padding(.horizontal, 5 * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                    
                    TextField("Search Pipeline", text: $value)
                        .multilineTextAlignment(.leading)
                        .font(Font.custom(FontBook.Regular.rawValue, size: 18 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                        .stroke(Color(App_Colors.App_Light_Gray_Color_3.rawValue), lineWidth: 1 * iPadMultiplier)
                )
                .padding(.bottom, 20 * iPadMultiplier)
                
                VStack(spacing: 18 * iPadMultiplier) {
                    ForEach(pipelineArr, id: \.self) { i in
                        Button(action: {
    //                        isSelected.toggle()
                            SelectedName = i
                        }) {
                            HStack {
                                Text(i)
                                    .font(Font.custom(FontBook.Semibold.rawValue, size: 18 * iPadMultiplier))
                                    .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                                Spacer()
                                Image(i == SelectedName ? "ic_Radio_Button_Fill" : "ic_Radio_Button")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32 * iPadMultiplier, height: 32 * iPadMultiplier)
                                    .padding(.horizontal, 5 * iPadMultiplier)
                                    .foregroundColor(i == SelectedName ? .red : .gray)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 20 * iPadMultiplier)
            SaveCancelButtons(cancelTitle: "Cancel", saveTitle: "Done",cancelAction: {
                
            }, saveAction: {
                
            })
        }
    }
}

struct SelectPipeline_Previews: PreviewProvider {
    static var previews: some View {
        SelectPipelineView()
    }
}
