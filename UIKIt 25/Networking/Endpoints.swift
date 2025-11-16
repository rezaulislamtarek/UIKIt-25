//
//  Endpoints.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 14/11/25.
//

import Foundation

enum Endpoints {
    case allFlags
    case plces
    case getAmbulance
    
    var path: String {
        switch self {
        case .allFlags:
            return "/countryflag?country=US"
        case .plces:
            return "/place/getPlacesByUpId/1"
        case .getAmbulance:
            return "/transport/getAmb"
        }
    }
}


 
