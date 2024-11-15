//
//  PipeLineBoardCell.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

struct PipeLineBoardCell: View {
    var arr = ["","","",""]
    @Binding var isSelected:Bool
    @Binding var cardId:String
    var body: some View {
        VStack(spacing:0){
            HStack{
                RoundedBorderChip(text: "1st Call Done", color:Color(hexString: "#FF9800"))
                Text("2").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B")).padding(.horizontal, 6 * iPadMultiplier).padding(.vertical, 4 * iPadMultiplier).background(Color(hexString: "#F0F0F0"), in: RoundedRectangle(cornerRadius: 100))
                Spacer()
            }.padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15)).overlay(
                RoundedRectangle(cornerRadius: 0) // Same radius as the background
                    .stroke(Color.gray, lineWidth: 1) // Gray border
            )
            HStack{
                Text("Total Value").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#656C73"))
                Spacer()
                Text("#532").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B")).padding(.horizontal, 6 * iPadMultiplier).padding(.vertical, 4 * iPadMultiplier).background(Color(hexString: "#F0F0F0"), in: RoundedRectangle(cornerRadius: 100))
            }.padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15)).background(Color(hexString: "#F0F0F0")).overlay(
                RoundedRectangle(cornerRadius: 0) // Same radius as the background
                    .stroke(Color.gray, lineWidth: 1) // Gray border
            )
            
            List(arr,id:\.self) {  item in//contact in
                PipeLineCardView(isSelected: $isSelected, cardId: $cardId)
                    .listRowSeparator(.hidden) // Optional: to hide list row separator
                    .listRowInsets(EdgeInsets()) // Optional: to remove default padding
            }
            .background(Color(.systemGroupedBackground))
            .listStyle(PlainListStyle()).overlay(
                RoundedRectangle(cornerRadius: 10) // Same radius as the background
                    .stroke(Color.gray, lineWidth: 1) // Gray border
                ) // Optional: to remove extra space on the list's top and bottom
            
            
            Spacer()
        }
    }
}

#Preview {
    PipeLineBoardCell(isSelected: .constant(false), cardId: .constant(""))
}
