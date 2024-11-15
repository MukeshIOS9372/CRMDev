//
//  ddwd.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 13/11/24.
//

import SwiftUI

struct MenuPickerView: View {
    var titleText: String = ""
    var isShowInfieldTitle = false
    var isShowProfileImage = false
    var isShowTrash = false
    var imageName: String?
    @Binding var selectedOption: String
    let action: () -> Void
    
//    @State private var selectedOption = "Scheduled"
    let options = ["Scheduled", "In Progress", "Completed"]

    var body: some View {
        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
            if !titleText.isEmpty {
                Text(titleText)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
            }
            HStack {
                HStack {
                    if isShowInfieldTitle {
                        Text("Sales -")
                            .font(Font.custom(FontBook.Regular.rawValue, size: 16 * iPadMultiplier))
                            .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
                    }
                    if isShowProfileImage {
                        Image(imageName ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4 * iPadMultiplier))
                    }
                    Text(selectedOption)
                        .font(Font.custom(FontBook.Regular.rawValue, size: 18 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
                    
                    Spacer()
                    
                    Menu {
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                selectedOption = option
                            }) {
                                Text(option)
                            }
                        }
                    } label: {
                        Image("ic_dropdown_arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                            .padding(.horizontal, 5 * iPadMultiplier)
                            .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
                    }
                }
                .padding(12 * iPadMultiplier)
                .background(
                    RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                        .stroke(Color(App_Colors.App_Light_Gray_Color_3.rawValue), lineWidth: 1 * iPadMultiplier)
                )
                
                if isShowTrash {
                    Button(action: action) {
                        Image("ic_trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                            .padding(.horizontal, 5 * iPadMultiplier)
                            .foregroundColor(.red)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            //        .padding(.horizontal)
        }
    }
}




struct MenuPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}

struct MenuPickerViewWrapper: View {
    @State private var selectedOption = "Scheduled"

    var body: some View {
        MenuPickerView(
            isShowInfieldTitle: false,
            isShowProfileImage: true,
            imageName: "muk",
            selectedOption: $selectedOption,
            action: {
                print("Trash icon tapped")
            }
        )
    }
}
