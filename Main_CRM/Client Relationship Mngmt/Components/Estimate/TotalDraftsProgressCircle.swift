//
//  TotalDraftsProgressCircle.swift
//  CRM_Dev
//
//  Created by Mukesh Behera on 25/10/24.
//

import SwiftUI

struct CircularProgressView: View {
    var total: Int
    var segments: [(color: Color, value: Double)] // Tuple with color and value percentage

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hexString: "#FAFAFA"))
                .cornerRadius(8 * iPadMultiplier)
                .frame(width: 90 * iPadMultiplier, height: 90 * iPadMultiplier)
                .overlay(
                    RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1 * iPadMultiplier)
                )
            
            ZStack {
                // Background Circle
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 15)
                    .frame(width: 55 * iPadMultiplier, height: 55 * iPadMultiplier)
                
                // Circular segments
                ForEach(0..<segments.count, id: \.self) { index in
                    let startAngle = startAngle(for: index)
                    let endAngle = endAngle(for: index)
                    
                    CircleSegment(startAngle: startAngle, endAngle: endAngle, color: segments[index].color)
                        .frame(width: 55 * iPadMultiplier, height: 55 * iPadMultiplier)
                }
                
                // Total number in the center
                VStack {
                    Text("\(total)")
                        .font(.system(size: 16 * iPadMultiplier, weight: .semibold))
                        .foregroundColor(.black)
                    Text("Total")
                        .font(.system(size: 10 * iPadMultiplier))
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    // Helper to calculate start angle
    private func startAngle(for index: Int) -> Double {
        let totalPercentage = segments.prefix(index).map { $0.value }.reduce(0, +)
        return 360 * totalPercentage - 90 // Subtract 90 to rotate it to start from top
    }
    
    // Helper to calculate end angle
    private func endAngle(for index: Int) -> Double {
        let totalPercentage = segments.prefix(index + 1).map { $0.value }.reduce(0, +)
        return 360 * totalPercentage - 90 // Subtract 90 to rotate it to start from top
    }
}

struct CircleSegment: View {
    var startAngle: Double
    var endAngle: Double
    var color: Color

    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            
            Path { path in
                path.addArc(center: CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2),
                            radius: radius,
                            startAngle: Angle(degrees: startAngle),
                            endAngle: Angle(degrees: endAngle),
                            clockwise: false)
            }
            .stroke(color, lineWidth: 15 * iPadMultiplier)
        }
        .frame(width: 55 * iPadMultiplier, height: 55 * iPadMultiplier) // Ensure frame size matches
    }
}

struct CircularProgressContentView: View {
    var body: some View {
        CircularProgressView(
            total: 411,
            segments: [
                (color: Color.green, value: 0.25),
                (color: Color.orange, value: 0.20),
                (color: Color.red, value: 0.55),
                (color: Color.blue, value: 0.20)
            ]
        )
    }
}

struct CircularProgressContentView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressContentView()
    }
}

