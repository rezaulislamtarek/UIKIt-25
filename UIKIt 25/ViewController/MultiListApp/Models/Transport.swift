//
//  Transport.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 16/11/25.
//

import Foundation

struct TransportResponse: Codable {
    let message: String
    let data: [Transport]
}

struct Transport: Codable, Equatable, Hashable {
    let id: Int
    let nameOrModel: String
    let regNo: String
    let phoneNumber: String
    let address: String
    let startTime: String
    let facility: String
}

extension Transport {
    static var mockList: [Transport] = [
        Transport(
            id: 15,
            nameOrModel: "Media Ambulance Service",
            regNo: "NA",
            phoneNumber: "01904500600",
            address: "Ruposdi, Bancharampur",
            startTime: "N/A",
            facility: "NA"
        ),
        Transport(
            id: 16,
            nameOrModel: "mahbubur rahman memorial hospital ambulance service",
            regNo: "NA",
            phoneNumber: "0172501455",
            address: "Ruposdi, Bancharampur",
            startTime: "N/A",
            facility: "NA"
        )
    ]
}
