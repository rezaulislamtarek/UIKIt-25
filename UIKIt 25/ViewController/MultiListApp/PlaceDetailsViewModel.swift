//
//  PlaceDetailsViewModel.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 17/11/25.
//

import Foundation

final class PlaceDetailsViewModel {
    @Published var place : Place?
    private var service : PlaceServiceProtocol
    
    init(service: PlaceServiceProtocol = PlaceService()) {
        self.service = service
    }
    
    func fetchPlaceDetails(id : Int) async {
        do {
            place = try await service.fetchPlace(by: id)
        } catch {
            print("Error fetching place \(error.localizedDescription)")
        }
    }
}
