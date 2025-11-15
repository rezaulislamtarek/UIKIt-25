//
//  FlagViewModel.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 14/11/25.
//

import Foundation

@MainActor
class FlagViewModel {
    // Output to UI
    @Published private(set) var flags: [Flag] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    
    private let service: FlagServiceProtocol
    
    init(service: FlagServiceProtocol = FlagService()) {
        self.service = service
    }
    
    func loadFlags() {
        print("flag loading...")
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        Task {
            do {
                let flags = try await self.service.fetchFlags()
                self.flags = flags
                print("flags loaded successfully \(flags)")
            } catch {
                errorMessage = error.localizedDescription
                print("Error loading flags: \(error.localizedDescription)")
            }
        }
    }
    
}
