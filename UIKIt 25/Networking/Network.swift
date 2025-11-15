//
//  Network.swift
//  UIKIt 25
//
//  Created by Rezaul Islam on 14/11/25.
//

import Foundation
import EasyNet

class Network {
    static let shared = Network()
    
    private let apiKey = "EbRZip3wkVozNuwxPKSHGA==burTpVYa05VMuDTB"
    
    // শুধু base URL দেবে — query এখানে দিবে না!
    let easyNet = EasyNet(baseUrl: "https://api.api-ninjas.com/v1", enableDebugLogging: true)
    
    private init() {
        configure()
    }
    
    private func configure() {
        easyNet.setHeaders(headers: [
            "X-Api-Key": apiKey
        ])
    }
}
