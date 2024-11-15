//
//  fdgdfgd.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 14/11/24.
//

import SwiftUI

struct TeamMembersView: View {
    let imageNames: [String] // Pass image names to this component
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * iPadMultiplier) {
            HStack {
                // Display the first line of images (up to 5 images)
                let firstLineImages = imageNames.prefix(5)
                ForEach(firstLineImages, id: \.self) { imageName in
                    profileImageView(imageName: imageName)
                        .frame(maxWidth: .infinity)
                }
                
                // Show extra count if total images exceed 9
                
                    
            }
            .frame(maxWidth: .infinity)
            // Display the second line of images if there are more than 5 images
            if imageNames.count > 5 {
                HStack {
                    let secondLineImages = imageNames.dropFirst(5).prefix(4) // Up to 4 images in the second line
                    ForEach(secondLineImages, id: \.self) { imageName in
                        profileImageView(imageName: imageName)
                            .frame(maxWidth: .infinity)
                    }
                    
                    if imageNames.count > 9 {
                        let extraCount = imageNames.count - 9
                        Text("+\(extraCount)")
                            .font(Font.custom(FontBook.Regular.rawValue, size: 16 * iPadMultiplier))
                            .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                            .frame(width: 62 * iPadMultiplier, height: 62 * iPadMultiplier)
                            .background(Color(App_Colors.App_White_Color.rawValue))
                            .clipShape(Circle())
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        
//        .padding()
    }
    
    // Helper view for profile images with a remove icon
    @ViewBuilder
    private func profileImageView(imageName: String) -> some View {
        ZStack(alignment: .topTrailing) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55 * iPadMultiplier, height: 55 * iPadMultiplier)
                .clipShape(Circle())
            
            // Remove icon
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.gray)
                .background(Color.white)
                .clipShape(Circle())
                .offset(x: 5 * iPadMultiplier, y: -8 * iPadMultiplier)
        }
    }
}

struct TeamMembersView_Previews: PreviewProvider {
    static var previews: some View {
        TeamMembersView(imageNames: ["muk", "muk", "muk", "muk", "muk", "muk", "muk", "muk", "muk", "muk", "muk"])
            .previewLayout(.sizeThatFits)
    }
}

