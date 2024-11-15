//
//  PipelineSheet.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

struct PipelineSheet: View {
    @State private var isSheetPresented = false

    var body: some View {
        ZStack {
            VStack {
                Text("Tap to show bottom sheet")
                    .font(.title)
                    .padding()
                
                Button("Show Bottom Sheet") {
                    withAnimation {
                        isSheetPresented.toggle()
                    }
                }
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            CommonBottomSheet(isPresented: $isSheetPresented, sheetHeight: 300) {
                StageOptionsSheet()
            }
        }
    }
}

#Preview {
    PipelineSheet()
}
