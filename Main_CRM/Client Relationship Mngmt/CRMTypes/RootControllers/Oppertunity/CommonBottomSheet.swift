//
//  CommonBottomSheet.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 14/11/24.
//

import SwiftUI

struct CommonBottomSheet<Content:View>: View {
    let content: Content
    @Binding var isPresented: Bool
    let sheetHeight: CGFloat

    @State private var offsetY: CGFloat = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    init( isPresented: Binding<Bool>, sheetHeight: CGFloat,@ViewBuilder content: () -> Content) {
        _isPresented = isPresented
        self.sheetHeight = sheetHeight
        self.content = content()
    }

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
                
            }.background(Color.black.opacity(0.2))
                .opacity(isPresented ? 1 : 0)
                .onTapGesture {
                    isPresented = false
                }

            VStack {
                Spacer()
                VStack(spacing: 0) {
                    Capsule()
                        .frame(width: 40 * iPadMultiplier, height: 5 * iPadMultiplier)
                        .foregroundColor(.gray)
                        .padding(.top, 8 * iPadMultiplier)
                    content
                }
                .frame(width: UIScreen.main.bounds.width, height: sheetHeight)
                .background(Color.white)
                .cornerRadius(16 * iPadMultiplier)
                .shadow(radius: 20 * iPadMultiplier)
                .offset(y:isPresented ? 0 : sheetHeight)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation.height
                        }
                        .onEnded { value in
                            // Dismiss or reset based on drag distance
                            if value.translation.height > 100 {
                                // Close the sheet if dragged down significantly
                                withAnimation {
                                    isPresented = false
                                }
                            } else {
                                // Snap back to the original position
                                withAnimation {
                                    offsetY = 0
                                }
                            }
                        }
                )
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CommonBottomSheet(isPresented: .constant(true), sheetHeight: 300 * iPadMultiplier) {
//        StageOptionsSheet()
    }
}
