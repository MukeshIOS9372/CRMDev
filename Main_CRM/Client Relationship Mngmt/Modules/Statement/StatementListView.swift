//
//  StatementListView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 11/11/24.
//

import SwiftUI

struct StatementListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Invoice Title and Balance
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Invoice ")
                        .font(.headline) +
                    Text("CNT-000158-24")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Text("(due on Apr. 11th, 2024)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Text("Balance: $15")
                    .foregroundColor(.red)
                    .font(.headline)
            }
            
            // Date, Amount, and Payment
            VStack(alignment: .leading, spacing: 4) {
                Text("Apr. 10th, 2024")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Amount:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("$1,000")
                        .font(.subheadline)
                        .bold()
                }
                
                HStack {
                    Text("Payment:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("$500")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
//        .padding()
    }
}

struct StatementListView_Previews: PreviewProvider {
    static var previews: some View {
        StatementListView()
            .previewLayout(.sizeThatFits)
    }
}
