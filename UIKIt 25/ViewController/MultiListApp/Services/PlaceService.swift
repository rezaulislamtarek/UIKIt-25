//
//  PlaceService.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import Combine

protocol PlaceServiceProtocol {
    func fetchPlaces() async throws -> [Place]
    func fetchPlace(by id: Int) async throws -> Place
}

class PlaceService: PlaceServiceProtocol {
    private var cancellable: Set<AnyCancellable> = []
    func fetchPlaces() async throws -> [Place] {
        print("PlaceService called ")
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Place], Error>) in
            Network.shared.easyNet.fetchData(endPoint: Endpoints.plces.path, responseType: PlaceResponse.self, extraHeaders: ["a" : "b"])
                .sink { completion in
                    print("completion called")
                    switch completion {
                    case .failure(let error):
                        print("completion called \(error) ")
                        continuation.resume(throwing: error)
                    case .finished:
                        break
                    }
                } receiveValue: { response in
                    continuation.resume(returning: response.data ?? [])
                }
                .store(in: &cancellable)
        }
    }
    
    func fetchPlace(by id: Int) async throws -> Place {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Place, Error>) in
            Network.shared.easyNet.fetchData(endPoint: Endpoints.placeDetails(id).path, responseType: PlaceDetailsResponse.self)
                .sink { completion in
                    print("completion called")
                    switch completion {
                    case .failure(let error):
                        print("completion called \(error) ")
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
    func fetchPlace(by id: Int) async throws -> Place {
        var place = Place.mockList.first!
        place.placeDetails = "Some details about the place here ... this is just a dummy text to fill the space ... it should be replaced with actual details. it should be replaced with actual details. it should be replaced with actual details."
        return place
    }
    
    func fetchPlaces() async throws -> [Place] {
        return Place.mockList
    }
}
