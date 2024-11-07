//
//  ServiceAddressViewModel.swift
//  MY_Crm
//
//  Created by Mukesh Behera on 06/11/24.
//

import SwiftUI
import Combine

@MainActor
class ServiceAddressViewModel: ObservableObject {
    @Published var items: [CommonVerticleListModel] = []
    @Published var isLoading: Bool = false
    @Published var showAlert = false
    @Published var errorMessage: String? = nil
    
    func fetchItems() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedItems: [CommonVerticleListModel] = try await NetworkService.shared.fetchData(
                from: "https://api.example.com/items",
                as: [CommonVerticleListModel].self
            )
            items = fetchedItems
        } catch {
            errorMessage = "Failed to load items: \(error.localizedDescription)"
            showAlert = true
        }
        
        isLoading = false
    }
}
