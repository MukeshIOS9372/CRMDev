//
//  StatementHeaderView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 11/11/24.
//

import SwiftUI

struct AccountSummaryView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Account Summary")
                .font(Font.custom(FontBook.Semibold.rawValue, size: 28 * iPadMultiplier))
                .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
            
            Text("From Apr.1st, 2024 to Apr.30th, 2024")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("For Jessica K.")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Showing all Invoices & Payments from")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Text("Apr.1st, 2024 to Apr.30th, 2024")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

struct AccountSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryView()
    }
}
