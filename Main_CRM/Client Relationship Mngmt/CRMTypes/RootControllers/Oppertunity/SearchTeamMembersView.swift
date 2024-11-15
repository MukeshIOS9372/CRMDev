//
//  SearchTeamMembersView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 15/11/24.
//

import SwiftUI

struct Member: Identifiable {
    let id = UUID()
    let role: String
    let name: String
    var isSelected: Bool
    var isAssigned: Bool
}

class MembersViewModel: ObservableObject {
    @Published var members: [Member] = [
        Member(role: "Carpenter", name: "James Bond", isSelected: true, isAssigned: false),
        Member(role: "Carpenter", name: "Creaser K.", isSelected: false, isAssigned: false),
        Member(role: "Carpenter", name: "Jack Dorsan", isSelected: false, isAssigned: false),
        Member(role: "Plumber", name: "Jessica J.", isSelected: false, isAssigned: true)
    ]
    
    func filteredMembers(for query: String) -> [Member] {
        guard !query.isEmpty else { return members }
        return members.filter { $0.name.localizedCaseInsensitiveContains(query) || $0.role.localizedCaseInsensitiveContains(query) }
    }
    
    func toggleSelection(for member: Member) {
            members = members.map {
                var updatedMember = $0
                if updatedMember.id == member.id && !member.isAssigned {
                    updatedMember.isSelected.toggle()
                } else if updatedMember.id != member.id {
                    updatedMember.isSelected = false
                }
                return updatedMember
            }
        }
}

// PreferenceKey to capture the position of the TextField
struct TextFieldPositionKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

// Main view
struct SearchTeamMembersView: View {
    @Binding var isShowingPopup: Bool
    @StateObject private var viewModel = MembersViewModel()
    var searchText: String    
    var didSelectMember: ((Member) -> Void)?
    
    var body: some View {
        List(viewModel.filteredMembers(for: searchText)) { member in
            TeamMemberRow(member: member)
                .background(
                    member.isSelected ? Color(App_Colors.App_Blue_Color.rawValue) :
                    member.isAssigned ? Color(App_Colors.App_White_Gray_Color.rawValue) :
                    Color(App_Colors.App_White_Color.rawValue)
                )
                .onTapGesture {
                    if !member.isAssigned {
                        viewModel.toggleSelection(for: member)
                        isShowingPopup = false // Hide the popup
                        didSelectMember?(member) // Pass selected member info
                    }
                }
                .cornerRadius(5 * iPadMultiplier)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 10 * iPadMultiplier, bottom: 0, trailing: 10 * iPadMultiplier))
                .padding(.bottom, 5 * iPadMultiplier)
        }
        .listStyle(PlainListStyle()) // Adjusts the list style as per the design
    }
}

// Row view for individual member
struct TeamMemberRow: View {
    let member: Member
    
    var body: some View {
        HStack(spacing: 16 * iPadMultiplier) {
            // Profile image placeholder
            Circle()
                .fill(Color.gray)
                .frame(width: 40 * iPadMultiplier, height: 40 * iPadMultiplier)
                .overlay(Text(member.name.prefix(1)))
            
            VStack(alignment: .leading, spacing: 2 * iPadMultiplier) {
                Text(member.role)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                    .foregroundColor(
                            member.isSelected ? .white :
                            member.isAssigned ? Color(App_Colors.App_Light_Gray_Color_3.rawValue) :
                            Color(App_Colors.App_Light_Gray_Color_2.rawValue)
                        )
                
                Text(member.name)
                    .font(Font.custom(FontBook.Regular.rawValue, size: 18 * iPadMultiplier))
                    .foregroundColor(
                            member.isSelected ? .white :
                            member.isAssigned ? Color(App_Colors.App_Light_Gray_Color_3.rawValue) :
                            Color(App_Colors.App_Black_Color.rawValue)
                        )
                if member.isAssigned {
                    Text("Already Assigned")
                        .font(Font.custom(FontBook.SemiboldIT.rawValue, size: 12 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
                }
            }
            
            Spacer()
            
            if member.isSelected {
                Image("ic_double_tick_mark")
                    .foregroundColor(.white)
            } else if member.isAssigned {
                Image("ic_circular_checkbox_fill")
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
                
            }
        }
        
        .padding()
    }
}


struct MembersListVieww_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}

struct PreviewWrapper: View {
    @State private var isShowingPopup: Bool = false
    @State private var searchText: String = ""

    var body: some View {
        SearchTeamMembersView(
            isShowingPopup: $isShowingPopup,
            searchText: searchText
        )
    }
}

