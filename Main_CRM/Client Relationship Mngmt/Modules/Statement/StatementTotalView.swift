//
//  StatementTotalView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 11/11/24.
//

import SwiftUI

struct BalanceSummaryView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Beginning Balance")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("$500")
                    .foregroundColor(.red)
            }
            Divider()
                .background(Color.gray.opacity(0.5))
            HStack {
                Text("Invoiced Amount")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("$15.50")
                    .foregroundColor(.primary)
            }
            Divider()
                .background(Color.gray.opacity(0.9))
            HStack {
                Text("Amount Paid")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("$515.50")
                    .foregroundColor(.primary)
            }
            Divider()
                .background(Color.gray.opacity(0.5))
            HStack {
                Text("Balance Due")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text("$0.00")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .cornerRadius(8)
    }
}

struct BalanceSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceSummaryView()
    }
}
