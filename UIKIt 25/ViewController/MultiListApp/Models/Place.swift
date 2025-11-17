//
//  Place.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import Foundation

struct PlaceResponse: Codable {
    let message: String
    var data: [Place]? = []
}

struct Place: Codable, Equatable, Hashable {
    let placeId: Int
    let placeName: String
    let photo: String
    let villageName: String
    let unionName: String
    var placeDetails: String? = nil
}

struct PlaceDetailsResponse: Codable {
    let message : String
    let data: Place
}

extension Place {
    static var mockList: [Place] = [
        Place(
            placeId: 5,
            placeName: "উজানচর জমিদার বাড়ী",
            photo: "/uploads/images/Screenshot 2022-09-10 at 9.29.20 AM.png",
            villageName: "Ujanchar",
            unionName: "Ujanchar"
        ),
        Place(
            placeId: 8,
            placeName: "রূপসদী জমিদার বাড়ি",
            photo: "/uploads/images/ruposdi.jpeg",
            villageName: "Rupasdi Is a big village in Rupushdi Union of Saifulakandi Upazila of Rangpur District in Bangladesh I need your help to save this village from being demolished. Please help me to save this village from being demolished.",
            unionName: "Rupushdi"
        ),
        Place(
            placeId: 9,
            placeName: "London House",
            photo: "/uploads/images/2.png",
            villageName: "Vhelanagar",
            unionName: "Saifullyakandi"
        ),
        Place(
            placeId: 10,
            placeName: "Domra Kandi Jamidar Bari",
            photo: "/uploads/images/3.png",
            villageName: "Domrakandi",
            unionName: "Saifullyakandi"
        ),
        Place(
            placeId: 11,
            placeName: "Domra Kandi Old Mosque",
            photo: "/uploads/images/4.png",
            villageName: "Domrakandi",
            unionName: "Saifullyakandi"
        ),
        Place(
            placeId: 12,
            placeName: "Akanagar Jamidar Bari",
            photo: "/uploads/images/7.png",
            villageName: "Akanagar",
            unionName: "Tazkhali"
        )
    ]
}

