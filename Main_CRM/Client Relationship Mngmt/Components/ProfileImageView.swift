//
//  ProfileImageView.swift
//  contractorplus
//
//  Created by Mukesh Behera on 23/10/24.
//  Copyright © 2024 ContractorPlus. All rights reserved.
//


import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        // Base sizes for iPhone
        let imageSize: CGFloat = 90 * iPadMultiplier
        
        ZStack(alignment: .bottomTrailing) {
            // Profile image
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.gray)
                .frame(width: imageSize * iPadMultiplier, height: imageSize * iPadMultiplier)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4 * iPadMultiplier))
            
            // Edit icon
            Circle()
                .fill(Color.blue)
                .frame(width: 26 * iPadMultiplier, height: 26 * iPadMultiplier)
                .overlay(
                    Image("editInWhite")
                        .resizable()
                        .frame(width: 18 * iPadMultiplier, height: 18 * iPadMultiplier)
                        .foregroundColor(.white)
                )
                .padding(4 * iPadMultiplier)
        }
        .padding(.leading, 20 * iPadMultiplier)
        .padding(.top, 20 * iPadMultiplier)
        // The frame is now the same size as the profile image
        .frame(width: imageSize * iPadMultiplier, height: imageSize * iPadMultiplier)
    }
}

struct ProfileContentView: View {
    var body: some View {
        ProfileImageView()
            .padding()
            .background(Color(UIColor.systemBackground))
            .edgesIgnoringSafeArea(.all)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentView()
            .previewDevice("iPhone 13 Pro")
        ProfileContentView()
            .previewDevice("iPad Pro (12.9-inch)")
    }
}
