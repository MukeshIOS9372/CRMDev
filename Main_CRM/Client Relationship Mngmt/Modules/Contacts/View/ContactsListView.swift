//
//  ContactsListView.swift
//  dummyofSwiftUI
//
//  Created by Contractor+ on 11/11/24.
//

import SwiftUI

struct ContactRow: View {
    var body: some View {
        HStack(alignment: .top) {
            // Profile Image
            Image("muk")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                // Name and Star Icon
                HStack {
                    Text("Contacts")
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                        .foregroundColor(Color(hexString: "#656C73"))
                        .fontWeight(.bold)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 12))
                }
                
                // Role Text
                Text("Owner")
                    .font(Font.custom(FontBook.Regular.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(Color(hexString: "#ADB1B5"))
            }
            
            Spacer()
            
            // Action Buttons
            HStack(spacing: 15) {
                ActionButton(imageName: "ic_phone_icon", color: Color(hexString: "#ADB1B5"))
                ActionButton(imageName: "message-circle-fill", color: Color(hexString: "#ADB1B5"))
                ActionButton(imageName: "ic_mail_envelope", color: Color(hexString: "#ADB1B5"))
                ActionButton(imageName: "menu-vertical-dots-black", color: Color(hexString: "#ADB1B5"))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
        )
    }
}

struct ContactListView: View {
//    var contacts: [Contact] = [] // Your contact data here

    var body: some View {
        List() { //contact in
            ContactRow()
                .listRowSeparator(.hidden) // Optional: to hide list row separator
                .listRowInsets(EdgeInsets()) // Optional: to remove default padding
        }
        .background(Color(.systemGroupedBackground))
        .listStyle(PlainListStyle()) // Optional: to remove extra space on the list's top and bottom
    }
}


// Reusable Action Button for icons
struct ActionButton: View {
    let imageName: String
    let color: Color

    var body: some View {
        Button(action: {
            // Action for button
        }) {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(color)
        }
    }
}

#Preview {
    ContactListView()
}
