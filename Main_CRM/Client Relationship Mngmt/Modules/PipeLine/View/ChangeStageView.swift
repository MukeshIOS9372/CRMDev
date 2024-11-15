//
//  ChangeStageView.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 14/11/24.
//

import SwiftUI

struct ChangeStageView: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 15){
            Text("Change Stage").font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B"))
            headerView.frame(height: 100)
            StageOptionsView(isSelected: .constant(false),tagTitle: "Active", tagColor: "#FF9800")
            StageOptionsView(isSelected: .constant(false),tagTitle: "Won", tagColor: "#5ED5A8")
            StageOptionsView(isSelected: .constant(false),tagTitle: "Lost", tagColor: "#E74C3C")
            Spacer()
            footerViewOfChooseStage()
        }.padding()
        
    }
    
    
    var headerView:some View{
        HStack{
            VerticalLine(color: Color.orange, width: 3)
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
                    Text( "To make this view tappable, you can wrap the To implement this in a SwiftUI-compatible way, we’ll use a UILabel to measure whether the text would exceed the specified line limit.").lineLimit(2).font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier)).foregroundColor(.gray)
                }
                
            }.padding().overlay{
                RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)
            }
        }
    }
}


struct footerViewOfChooseStage:View{
    var body: some View{
        HStack{
            Spacer()
            Button(action: {
                
            }){
                HStack{
                    Spacer()
                    Text("Cancel").font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B"))
                    Spacer()
                }
            }.padding().cornerRadius(10)
            Button(action: {
                
            }){
                HStack{
                    Spacer()
                    Text("Done").font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier)).foregroundColor(Color.white)
                    Spacer()
                }
            }.padding().background(.red).cornerRadius(10).frame(width: UIScreen.main.bounds.width/1.6, height: 40)
        }
    }
}


struct StageOptionsView:View{
    @Binding var isSelected: Bool
    var tagTitle:String
    var tagColor:String
    var body: some View{
        VStack(alignment:.leading){
            RoundedBorderChip(text: tagTitle, color: Color(hexString: tagColor))
            List(["","",""],id:\.self){ item in
                HStack{
                    Text("Renewal").font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B"))
                    Spacer()
                    ZStack {
                        // Background circle for unselected state
                        Circle()
                            .strokeBorder(Color.gray, lineWidth: 2)
                            .frame(width: 24, height: 24)
                        
                        // Filled circle for selected state
                        if isSelected {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 14, height: 14)
                        }
                    }
                    .onTapGesture {
                        // Toggle the selection state when tapped
                        isSelected.toggle()
                        print("Radio button tapped, isSelected: \(isSelected)")
                    }
                }
                
            }.listStyle(PlainListStyle())
        }.padding().background(Color(hexString: "#ADB1B5").opacity(0.1)).cornerRadius(10)
    }
}


#Preview {
    ChangeStageView()
}
