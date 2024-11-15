//
//  OpportunityPipeLineRootVC.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

import Combine

struct OpportunityPipeLineRootVC: View {
    var arr = ["", "", "", ""]
    @State private var name:HeaderType? = nil
    @State private var isSheetPresented: Bool = false
    @State private var triggerChagnes:Bool = false
    @State private var isCardClick:Bool = false
    @State private var cardId:String = ""
    var body: some View {
        ZStack {
            VStack {
                PipeLineViewHeader(name: $name, triggerChanges: $triggerChagnes)
                
                // Horizontal scroll view for PipeLineBoardCell
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(arr, id: \.self) { item in
                            PipeLineBoardCell(isSelected:$isCardClick, cardId: $cardId)
                                .frame(width: UIScreen.main.bounds.width * 0.87)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .background(Color(.systemGroupedBackground))
                }
                if isCardClick{
                    changeCardStageView
                }
            }// Use onReceive to detect changes to `name` using a 
            .onChange(of: triggerChagnes) { _ in
                isSheetPresented = true
            }
            floatingButton
            
            CommonBottomSheet(isPresented: $isSheetPresented, sheetHeight: 300) {
                if name == .stageOptions{
                    StageOptionsSheet()
                }
            }
    
        }
    }
    
    private var changeCardStageView: some View{
        VStack (spacing:5){
            Text("Mark As  Won / Active Or Lost").font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B"))
            Text("Tap here and choose a status").font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier)).foregroundColor(Color(hexString: "#3F464B"))
        }.padding().shadow(radius: 20).onTapGesture {
            print("won/active/ lost \(cardId)")
            NavigationView {
                VStack {
                    NavigationLink("Go to Detail View", destination: ChangeStageView())
                }
                .navigationTitle("Home")
            }
        }
    }
    
    // Floating button view
    private var floatingButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(hexString: "#F21314"))
                        .shadow(radius: 5)
                        .overlay(
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        )
                        .offset(x: -20, y: -50)
                        .gesture(
                            TapGesture()
                                .onEnded {
                                    print("Floating button tapped")
                                }
                        )
                }
            }
        }
    }
}

struct OpportunityPipeLineRootVC_Previews: PreviewProvider {
    static var previews: some View {
        OpportunityPipeLineRootVC()
    }
}


#Preview {
    OpportunityPipeLineRootVC()
}


struct OpportunityPipeLineView: View {
    var body: some View {
        OpportunityPipeLineRootVC()
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
    }
}

struct Opportunity_PipeLine_Previews: PreviewProvider {
    static var previews: some View {
        OpportunityPipeLineRootVC()
            .previewDevice("iPhone 13 Pro")
        OpportunityPipeLineRootVC()
            .previewDevice("iPad Pro (12.9-inch)")
    }
}
