//
//  TimeFilterView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 15/11/24.
//

import SwiftUI

struct TimeFilterView: View {
    @State private var text: String = "Tomorrow"
    @State private var isSelected: Bool = false
    var timeArr = ["Tomorrow", "This Week", "This Month", "This Year"]
    
    var body: some View {
        
        VStack {
            VStack {
                HStack(spacing: 2 * iPadMultiplier) {
                    Text("Time Filter")
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 18 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                    Image("ic_info")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                        .padding(.horizontal, 5 * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
                    Spacer()
                }
                .padding(.bottom, 20 * iPadMultiplier)
                HStack(spacing: 10 * iPadMultiplier) {
                    DatePickerView(titleText: "Start Date")
                    DatePickerView(titleText: "End Date")
                }
                .padding(.bottom, 16 * iPadMultiplier)
                
                HStack {
                    ForEach(timeArr, id: \.self) { i in
                        Button(action: {
                            text = i
                        }) {
                            Text(i)
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                .foregroundColor(Color(i != text ? App_Colors.App_Light_Gray_Color_2.rawValue : App_Colors.App_White_Color.rawValue))
                                .padding(6 * iPadMultiplier)
                            
                        }
                        .background(Color(i != text ? App_Colors.App_White_Color.rawValue : App_Colors.App_Blue_Color.rawValue))
                        .cornerRadius(6 * iPadMultiplier)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6 * iPadMultiplier)
                                .stroke(Color(App_Colors.App_Light_Gray_Color_1.rawValue), lineWidth: 1 * iPadMultiplier)
                        )
                        Spacer()
                    }
                }
                .padding(.bottom, 22 * iPadMultiplier)
                
                
                HStack {
                    Text("All Time")
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                    Spacer()
                    Button(action: {
                        isSelected.toggle()
                    }) {
                        HStack(spacing: 2 * iPadMultiplier) {
                            Image(isSelected ? "ic_checkbox_fill" : "ic_checkbox_blank")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                                .padding(.horizontal, 5 * iPadMultiplier)
                                .foregroundColor(isSelected ? .red : .gray)
                        }
                    }
                }
                .padding(.bottom, 22 * iPadMultiplier)
            }
            .padding(.horizontal, 15 * iPadMultiplier)
            
            SaveCancelButtons(cancelTitle: "Clear All",saveTitle: "Apply Filter",cancelAction: {
                
            }, saveAction: {
                
            })
        }
    }
}

struct TimeFilterView_Previews: PreviewProvider {
    static var previews: some View {
        TimeFilterView()
    }
}
