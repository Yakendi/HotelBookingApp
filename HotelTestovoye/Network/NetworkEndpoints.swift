//
//  NetworkEndpoints.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 31.08.2023.
//

import Foundation

struct Endpoint {
    var path: String
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = "/v3/" + path
        return components.url
    }
}

extension Endpoint {
    static func hotels() -> Self {
        Endpoint(path: "35e0d18e-2521-4f1b-a575-f0fe366f66e3")
    }
    
    static func rooms() -> Self {
        Endpoint(path: "f9a38183-6f95-43aa-853a-9c83cbb05ecd")
    }
    
    static func book() -> Self {
        Endpoint(path: "e8868481-743f-4eb2-a0d7-2bc4012275c8")
    }
}
