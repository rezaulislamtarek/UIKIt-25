//
//  FlagService.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 14/11/25.
//

import Foundation
import Combine
import EasyNet

protocol FlagServiceProtocol {
    func fetchFlags() async throws -> [Flag]
}

class FlagService: FlagServiceProtocol {
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchFlags() async throws -> [Flag] {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Flag], Error>) in
            Network.shared.easyNet
                .fetchData(endPoint: Endpoints.allFlags.path,
                           responseType: Flag.self)
                .sink { [weak self] completion in
                    guard self != nil else { return }
                    
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        let er = error as? EasyNetError
                        print("Error \(er)")
                        continuation.resume(throwing: error)
                    }
                } receiveValue: { flags in
                    continuation.resume(returning: [flags])
                }
                .store(in: &self.cancellables)
        }
    }
}
