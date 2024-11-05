//
//  NetworkService.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 05/11/24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()  // Singleton instance
    
    private init() {}  // Private initializer to enforce singleton pattern
    
    func fetchData<T: Decodable>(from urlString: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
