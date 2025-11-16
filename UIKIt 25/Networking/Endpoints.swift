//
//  Endpoints.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 14/11/25.
//

import Foundation

enum Endpoints {
    static let baseUrl : String = "https://api.smartbancharampur.com"
    case allFlags
    case plces
    case getAmbulance
    
    var path: String {
        switch self {
        case .allFlags:
            return "/countryflag?country=US"
        case .plces:
            return "/api/place/getPlacesByUpId/1"
        case .getAmbulance:
            return "/api/transport/getAmb"
        }
    }
}


 
