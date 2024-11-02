//
//  GradientProgressBar.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 28/10/24.
//

import SwiftUI

struct GradientProgressBar: View {
    var progress: Float // Progress value between 0.0 and 1.0

    var body: some View {
        GeometryReader { geometry in
            // Calculate width based on progress
            let width = CGFloat(min(max(progress, 0.0), 1.0)) * geometry.size.width
            
            // Background bar
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.3)) // Light gray background
                .frame(height: 5) // Height of the progress bar
                .overlay(
                    // Gradient progress bar
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [
                                Color.red,
                                Color.orange,
                                Color.yellow,
                                Color.green,
                                Color.blue,
                                Color.purple
                            ]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: width) // Set width based on progress
                        .animation(nil) // Ensure animation compatibility
                )
        }
        .frame(height: 5) // Set frame height for the entire view
        // .padding(.horizontal) // Optional horizontal padding
    }
}

// Preview for GradientProgressBar
struct GradientProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        GradientProgressBar(progress: 0.75) // Example with 75% progress
            .frame(height: 20) // Set frame height for preview
            .padding() // Optional padding
    }
}





