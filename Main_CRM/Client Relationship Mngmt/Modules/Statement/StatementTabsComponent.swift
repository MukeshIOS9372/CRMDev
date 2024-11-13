//
//  StatementTabsComponent.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 11/11/24.
//

import SwiftUI

struct StatementTabsComponent: View {
    let statements = [
        Statement(id: 1, amount: "$1,000", date: "Apr. 10th, 2024"),
        Statement(id: 2, amount: "$500", date: "Apr. 15th, 2024"),
        Statement(id: 3, amount: "$2,000", date: "May 1st, 2024")
    ]
    
    var body: some View {
        VStack{
            Spacer().frame(height: 15)
            StatementHeaderView(title: "Statement", amount: "$8,450.00")
                .padding(.bottom, 10)
            StatementActionsView()
            
            ScrollView {
                VStack(spacing: 10) {
                    AccountSummaryView()
                    ForEach(statements) { statement in
                        StatementListView()
                    }
                    BalanceSummaryView()
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    StatementTabsComponent()
}
struct Statement: Identifiable {
    let id: Int
    let amount: String
    let date: String
}
