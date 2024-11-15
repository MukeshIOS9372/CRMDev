//
//  TeamMemberFilterView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 15/11/24.
//

import SwiftUI

struct TeamMemberFilterView: View {
    @State private var isSelected: Bool = false
    @State private var SelectedName = ""
    var pipelineArr = ["Sales", "Demo Done", "Estimate Done"]

    @State private var searchTeamText: String = ""
    @State private var isShowingTeamPopup: Bool = false
    @State private var teamTextFieldPosition: CGRect = .zero

    @State private var searchLeadsText: String = ""
    @State private var isShowingLeadsPopup: Bool = false
    @State private var leadsTextFieldPosition: CGRect = .zero
    @State private var selectedTeamMember: Member?
    @State private var selectedLeadMember: Member?

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                // Filters Title
                HStack(spacing: 2 * iPadMultiplier) {
                    Text("Filters")
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 18 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                    Image("ic_info")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20 * iPadMultiplier, height: 20 * iPadMultiplier)
                        .padding(.horizontal, 5 * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_3.rawValue))
                    Spacer()
                }
                .padding(.bottom, 24 * iPadMultiplier)

                // Team Members Filter
                VStack(alignment: .leading) {
                    HStack {
                        Text("Filter by Team Members")
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                            .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                        Spacer()
                    }
                    Rectangle()
                        .frame(height: 0.5 * iPadMultiplier)
                        .foregroundColor(.gray)
                        .padding(.bottom, 15 * iPadMultiplier)
                }

                // Team Members Search Field
                HStack {
                    Image("ic_search")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                        .padding(.horizontal, 5 * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))

                    TextField("Search email, phone, name...", text: $searchTeamText, onEditingChanged: { isEditing in
                        isShowingTeamPopup = true
                    })
                    .multilineTextAlignment(.leading)
                    .font(Font.custom(FontBook.Regular.rawValue, size: 18 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                    .background(GeometryReader {
                        Color.clear.preference(key: TextFieldPositionKey.self, value: $0.frame(in: .global))
                    })
                    .onChange(of: searchTeamText) { newValue in
                        isShowingTeamPopup = !newValue.isEmpty
                    }
                    .onPreferenceChange(TextFieldPositionKey.self) { value in
                        self.teamTextFieldPosition = value
                    }
                }
                .padding(12 * iPadMultiplier * iPadMultiplier)
                .background(
                    RoundedRectangle(cornerRadius: 8 * iPadMultiplier * iPadMultiplier)
                        .stroke(Color(App_Colors.App_Light_Gray_Color_3.rawValue), lineWidth: 1)
                )
                .padding(.bottom, 12 * iPadMultiplier * iPadMultiplier)

                TeamMembersView(imageNames: ["muk", "muk", "muk", "muk", "muk"])
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20 * iPadMultiplier * iPadMultiplier)

                // Leads Filter
                VStack(alignment: .leading) {
                    HStack {
                        Text("Filter by Leads")
                            .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                            .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                        Spacer()
                    }
                    Rectangle()
                        .frame(height: 0.5 * iPadMultiplier * iPadMultiplier)
                        .foregroundColor(.gray)
                        .padding(.bottom, 15 * iPadMultiplier * iPadMultiplier)
                }

                // Leads Search Field
                HStack {
                    Image("ic_search")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24 * iPadMultiplier * iPadMultiplier, height: 24 * iPadMultiplier * iPadMultiplier)
                        .padding(.horizontal, 5 * iPadMultiplier * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))

                    TextField("Search email, phone, name...", text: $searchLeadsText)
                        .multilineTextAlignment(.leading)
                        .font(Font.custom(FontBook.Regular.rawValue, size: 18 * iPadMultiplier))
                        .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                        .background(GeometryReader {
                            Color.clear.preference(key: TextFieldPositionKey.self, value: $0.frame(in: .global))
                        })
                        .onChange(of: searchLeadsText) { newValue in
                            isShowingLeadsPopup = !newValue.isEmpty
                        }
                        .onPreferenceChange(TextFieldPositionKey.self) { value in
                            self.leadsTextFieldPosition = value
                        }
                }
                .padding(12 * iPadMultiplier * iPadMultiplier)
                .background(
                    RoundedRectangle(cornerRadius: 8 * iPadMultiplier * iPadMultiplier)
                        .stroke(Color(App_Colors.App_Light_Gray_Color_3.rawValue), lineWidth: 1 * iPadMultiplier * iPadMultiplier)
                )
                .padding(.bottom, 12 * iPadMultiplier * iPadMultiplier)

                TeamMembersView(imageNames: ["muk", "muk", "muk", "muk", "muk"])
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20 * iPadMultiplier * iPadMultiplier)
            }
            .overlay(
                ZStack {
                    if isShowingTeamPopup {
                        SearchTeamMembersView(isShowingPopup: $isShowingTeamPopup, searchText: searchTeamText, didSelectMember: { member in
                            selectedTeamMember = member
                            searchTeamText = member.name // Update the text in the search field
                            isShowingTeamPopup = false
                        })
                        .frame(width: UIScreen.main.bounds.width - 20 , height: 200 * iPadMultiplier)
                        .background(Color.white)
                        .cornerRadius(8 * iPadMultiplier)
                        .shadow(radius: 10 * iPadMultiplier)
                        .position(
                            x: UIScreen.main.bounds.width / 2.15,
                            y: teamTextFieldPosition.maxY + (250 * iPadMultiplier)
                        )
                    }

                    if isShowingLeadsPopup {
                        SearchTeamMembersView(isShowingPopup: $isShowingLeadsPopup, searchText: searchLeadsText, didSelectMember: { member in
                            selectedLeadMember = member
                            searchLeadsText = member.name // Update the text in the search field
                            isShowingLeadsPopup = false
                        })
                        .frame(width: UIScreen.main.bounds.width - 20, height: 200 * iPadMultiplier)
                        .background(Color.white)
                        .cornerRadius(8 * iPadMultiplier)
                        .shadow(radius: 10 * iPadMultiplier)
                        .position(
                            x: UIScreen.main.bounds.width / 2.15,
                            y: leadsTextFieldPosition.maxY + (186 * iPadMultiplier)
                        )
                    }
                }
            )
            .padding(.horizontal, 15 * iPadMultiplier)
            SaveCancelButtons(cancelTitle: "Clear All", saveTitle: "Apply Filter", cancelAction: {}, saveAction: {})
        }
    }
}

struct TeamMemberFilter_Previews: PreviewProvider {
    static var previews: some View {
        TeamMemberFilterView()
    }
}

