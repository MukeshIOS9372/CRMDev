//
//  PipeLineCardView.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

struct PipeLineCardView: View {
    @Binding var isSelected:Bool
    @Binding var cardId:String
    var body: some View {
        HStack(alignment:.top){
            VerticalLine(color: Color.orange, width: 5)
            VStack(alignment:.leading){
            CardHeaderView()
                ForEach(0 ..< 3) { index in
                    OpportunityCardDetailsCell(cellTitle: "Team Member",cellValue: "INV-000344",shouldImageShow:false,isRelatedTypeValue:true)
                }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    Text("+15 More").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                        .foregroundColor(Color(hexString: "#656C73")).padding().frame(maxWidth: .infinity).simultaneousGesture(TapGesture().onEnded {
                    print("Tapped item more")
                })
            }.overlay(
                RoundedRectangle(cornerRadius: 10) // Same radius as the background
                    .stroke(Color.gray, lineWidth: 1) // Gray border
                )
            .onTapGesture {
                isSelected.toggle()
                cardId = "1"
            }
            .onLongPressGesture {
                print("long press")
            }
            Spacer()
        }.padding()
    }
}


struct CardHeaderView:View{
    var body: some View {
        VStack{
            HStack(alignment:.top, spacing: 10 * iPadMultiplier){
                Image("justin_profile_icon").resizable().frame(width: 45, height: 45).clipShape(Circle())
                VStack(spacing: 10 * iPadMultiplier){
                    HStack{
                        VStack(alignment: .leading){
                            Text("M. Jackson Kelly").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(.blue)
                            HStack{
                                HStack{
                                    Text("$1200").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(.gray)
                                    Text("50%").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color.orange)
//                                    Text("on 1/11/12").font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier)).foregroundColor(.gray)
                                }
                            }
                        }
                        Spacer()
                        VStack(alignment:.trailing){
                                Rectangle().frame(width: 15, height: 15).cornerRadius(4).foregroundColor(Color(hexString: "#FF9800")).simultaneousGesture(TapGesture().onEnded {
                                print("Tapped item card")
                            })
                            Text("Aug. 12, 2024").font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier)).foregroundColor(.gray)
                        }
                    }
                    ExpandableTextView(text: "To make this view tappable, you can wrap the To implement this in a SwiftUI-compatible way, we’ll use a UILabel to measure whether the text would exceed the specified line limit.", lineLimit: 2)
                }
                
            }.padding()
        }
    }
}


struct OpportunityCardDetailsCell:View{
    var cellTitle:String
    var cellValue:String?
    var shouldImageShow:Bool = false
    var isRelatedTypeValue:Bool = true
    var imgName:String?
    
    var body: some View {
        HStack(spacing: 3 * iPadMultiplier){
            Text(cellTitle).font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B"))
            Spacer()
            if !isRelatedTypeValue{
                if shouldImageShow{
                    Image(imgName ?? "").resizable().frame(width: 20, height: 20).clipShape(Circle())
                }
                Text(cellValue ?? "").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B"))
            }else{
                Button(action: {
                    print("tapped")
                }){
                    Text(cellValue ?? "").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#3B82F6"))
                }.buttonStyle(PlainButtonStyle())
            }
            
        }.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)).background(Color.gray.opacity(0.1)).cornerRadius(5 * iPadMultiplier)
    }
}

#Preview {
    PipeLineCardView(isSelected: .constant(false), cardId: .constant(""))
}
