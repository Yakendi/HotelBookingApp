//
//  HotelModel.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 31.08.2023.
//

import Foundation

struct HotelsModel: Codable {
    let id: Int
    let name: String
    let adress: String
    let minPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let images: [String]
    let aboutHotel: [AboutHotel]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, adress, rating
        case minPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case ratingName = "rating_name"
        case images = "image_urls"
        case aboutHotel = "about_the_hotel"
    }
}

struct AboutHotel: Codable {
    let description: String
    let peculiarities: [String]
}
