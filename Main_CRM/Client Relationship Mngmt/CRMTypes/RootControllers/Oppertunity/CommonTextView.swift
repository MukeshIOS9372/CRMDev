//
//  dfdf.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 13/11/24.
//


import SwiftUI

struct CommonTextView: View {
    @State private var text: String = ""
    @State private var height: CGFloat = 100  // Initial height
    var titleText: String = ""
    var isShowTrash = false
    let action: () -> Void
    
    var body: some View {
//        VStack {
        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
            if !titleText.isEmpty {
                Text(titleText)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
            }
            HStack(alignment: .top) {
                ZStack(alignment: .topLeading) {
                    // Placeholder
                    if text.isEmpty {
                        Text("Type here...")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 14 * iPadMultiplier)
                            .padding(.vertical, 12 * iPadMultiplier)
                            .zIndex(1 * iPadMultiplier)
                    }
                    
                    // TextEditor
                    TextEditor(text: $text)
                        .frame(height: height)
                    //                    .padding(.horizontal, 8)
                    //                    .padding(.vertical, 10)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5 * iPadMultiplier)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5 * iPadMultiplier)
                                .stroke(Color(App_Colors.App_Light_Gray_Color_3.rawValue), lineWidth: 1 * iPadMultiplier)
                        )
                }
                .overlay(
                    // Resizable handle at bottom-right corner
                    Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .foregroundColor(.gray)
                        .padding(6 * iPadMultiplier)
                        .background(Color.white)
                        .offset(x: -8 * iPadMultiplier, y: -8 * iPadMultiplier)
                        .gesture(
                            DragGesture().onChanged { value in
                                // Increase height based on drag amount
                                height += value.translation.height
                            }
                        ),
                    alignment: .bottomTrailing
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
        }
        //        .padding()
    }
}

struct CommonTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommonTextView(action: {
            
        })
    }
}


