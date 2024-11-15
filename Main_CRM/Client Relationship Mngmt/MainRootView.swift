//
//  MainRootView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 08/11/24.
//

import SwiftUI

struct MainRootView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                NavigationLink(destination: CRMRootController()) {
                    Text("CRM Details")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: ServiceAddressRootController()) {
                    Text("Service Address")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: JobsRootController()) {
                    Text("Jobs Details")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: OpportunityAddEditView()) {
                    Text("Opportunity")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                NavigationLink(destination: TeamMemberFilterView()) {
                    Text("Team filter")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
            }
        }
    }
}

#Preview {
    MainRootView()
}
