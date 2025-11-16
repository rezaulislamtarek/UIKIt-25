//
//  AmbulanceService.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import Foundation
import Combine

protocol AmbulanceServiceProtocol {
    func getAmbulance() async throws -> [Transport]
}

class AmbulanceService : AmbulanceServiceProtocol {
    private var cancellable: Set<AnyCancellable> = []
    func getAmbulance() async throws -> [Transport] {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Transport], Error>) in
            Network.shared.easyNet.fetchData(endPoint: Endpoints.getAmbulance.path, responseType: TransportResponse.self)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    case .finished:
                        break
                    }
                } receiveValue: { response in
                    continuation.resume(returning: response.data)
                }
                .store(in: &cancellable)
        }
    }
}

class FakeAmbulanceService : AmbulanceServiceProtocol {
    func getAmbulance() async throws -> [Transport] {
        return Transport.mockList
    }
}
