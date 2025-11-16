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
    let easyNet = EasyNet(baseUrl: "https://api.smartbancharampur.com/api", enableDebugLogging: true)
    private init() { }
}
