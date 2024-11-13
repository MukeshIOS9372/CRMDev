//
//  StatementActionsView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 11/11/24.
//

import SwiftUI

struct StatementActionsView: View {
    @State private var selectedRange = "This Week"
        
        var body: some View {
            HStack(spacing: 16) {
                // Envelope Button
                Button(action: {
                    // Action for envelope button
                    print("Envelope button tapped")
                }) {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                }
                
                // Printer Button
                Button(action: {
                    // Action for printer button
                    print("Printer button tapped")
                }) {
                    Image(systemName: "printer")
                        .foregroundColor(.gray)
                }
                
                // Download Button
                Button(action: {
                    // Action for download button
                    print("Download button tapped")
                }) {
                    Image(systemName: "arrow.down.circle")
                        .foregroundColor(.gray)
                }
                Spacer()
                // "This Week" Dropdown Button
                Menu {
                    Button("Today") { selectedRange = "Today" }
                    Button("This Week") { selectedRange = "This Week" }
                    Button("This Month") { selectedRange = "This Month" }
                } label: {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                        
                        Text(selectedRange)
                            .foregroundColor(.black)
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                }
            }
            .padding(.horizontal)
        }
}

struct StatementActionsView_Previews: PreviewProvider {
    static var previews: some View {
        StatementActionsView()
            .previewLayout(.sizeThatFits)
    }
}
