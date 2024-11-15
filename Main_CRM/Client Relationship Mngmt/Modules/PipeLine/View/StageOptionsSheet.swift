//
//  StageOptionsSheet.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 13/11/24.
//

import SwiftUI

struct StageOptionsSheet: View {
    @State private var isSelected = false // State to track the selected option
    @State private var optionsArr = [  // Use @State to make it mutable
        StageOption(title: "Active Only", description: "Show opportunities that are in an active stage only", isSelected: true),
        StageOption(title: "All Stages", description: "Show all opportunities including won & lost", isSelected: false)
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Stage Options")
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                    .foregroundColor(.black)
                Spacer()
            }
            VStack(spacing: 20) {
                ForEach($optionsArr) { $option in  // Use $optionsArr to get a binding for each option
                    StageOptions(
                        title: option.title,
                        description: option.description,
                        isSelected: $option.isSelected  // Bind the selection state of each option
                    )
                }
                HStack {
                    Toggle(isOn: $isSelected) {
                        Text("Show Custom Fields")
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                            .foregroundColor(.black)
                    }
                }
            }
            
        }
        .padding()
    }
}


struct StageOptions: View {
    var title: String
    var description: String
    @Binding var isSelected: Bool // Use @Binding to allow parent view to control this state
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                .foregroundColor(.black)
            
            HStack {
                Text(description)
                    .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(.gray)
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
        }
    }
}

struct StageOption:Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var isSelected: Bool
}

#Preview {
    StageOptionsSheet()
}
