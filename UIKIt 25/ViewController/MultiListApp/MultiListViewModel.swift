//
//  MultiListViewModel.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//
import Combine

class MultiListViewModel {
    private var ambService: AmbulanceServiceProtocol
    private var placeService: PlaceServiceProtocol
    
    @Published var places: [Place] = []
    @Published var ambulances: [Transport] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(ambService: AmbulanceServiceProtocol = AmbulanceService(), placeService: PlaceServiceProtocol = MockPlaceService()) {
        self.ambService = ambService
        self.placeService = placeService
    }
    
    
    func loadData() async {
        isLoading = true
        errorMessage = nil
        
        do {
            async let ambResult = ambService.getAmbulance()
            async let placeResult = placeService.fetchPlaces()
            
            let (ambs, plcs) = try await (ambResult, placeResult)
            self.ambulances = ambs
            self.places = plcs
        }catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
}
