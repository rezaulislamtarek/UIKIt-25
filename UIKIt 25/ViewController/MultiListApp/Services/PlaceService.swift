//
//  PlaceService.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import Combine

protocol PlaceServiceProtocol {
    func fetchPlaces() async throws -> [Place]
}

class PlaceService: PlaceServiceProtocol {
    private var cancellable: Set<AnyCancellable> = []
    func fetchPlaces() async throws -> [Place] {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Place], Error>) in
            Network.shared.easyNet.fetchData(endPoint: Endpoints.plces.path, responseType: PlaceResponse.self)
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

class MockPlaceService: PlaceServiceProtocol {
    func fetchPlaces() async throws -> [Place] {
        return Place.mockList
    }
}
