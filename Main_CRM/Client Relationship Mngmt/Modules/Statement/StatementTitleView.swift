//
//  StatementTitleView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 11/11/24.
//

import SwiftUI

struct StatementHeaderView: View {
    var title: String
    var amount: String
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Text("Balance Due: ")
                    .font(.subheadline)
                    .foregroundColor(.gray) +
                Text(amount)
                    .font(.subheadline)
                    .bold()
            }
            .padding(.bottom, 4)
            Divider()
                .background(Color.gray.opacity(0.5))
        }
        .padding(.horizontal)
    }
}

struct StatementHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StatementHeaderView(title: "Statement", amount: "$8,450.00")
            .previewLayout(.sizeThatFits)
    }
}

