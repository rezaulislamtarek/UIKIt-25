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
    let easyNet = EasyNet(baseUrl: Endpoints.baseUrl, enableDebugLogging: true)
    private init() {
        easyNet.setHeaders(headers: ["String" : "String"])
    }
}
