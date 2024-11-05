//
//  ProfileImageView.swift
//  contractorplus
//
//  Created by Mukesh Behera on 23/10/24.
//  Copyright © 2024 ContractorPlus. All rights reserved.
//


import SwiftUI

enum ProfileImageShape {
    case circular
    case rectangular
}

struct ProfileImageView: View {
    var imageName: String
    var shape: ProfileImageShape
    
    var body: some View {
        // Base size for profile image
        let imageSize: CGFloat = 90 * iPadMultiplier
        
        ZStack(alignment: .bottomTrailing) {
            // Profile image with shape based on `shape` parameter
            if shape == .circular {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4 * iPadMultiplier))
            } else {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 95, height: 72)
                    .clipShape(RoundedRectangle(cornerRadius: 12 * iPadMultiplier))
                    .overlay(RoundedRectangle(cornerRadius: 12 * iPadMultiplier).stroke(Color.white, lineWidth: 4 * iPadMultiplier))
            }
            
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
        .frame(width: imageSize, height: imageSize)
    }
}

struct ProfileContentView: View {
    var body: some View {
        VStack {
            ProfileImageView(imageName: "justin_profile_icon", shape: .circular)
            ProfileImageView(imageName: "preview_img", shape: .rectangular)
        }
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
