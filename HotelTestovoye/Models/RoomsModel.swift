//
//  HotelModel.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 31.08.2023.
//

import Foundation

struct RoomsModel: Codable {
    let rooms: [Rooms]
}

struct Rooms: Codable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let images: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, price, peculiarities
        case pricePer = "price_per"
        case images = "image_urls"
    }
}
