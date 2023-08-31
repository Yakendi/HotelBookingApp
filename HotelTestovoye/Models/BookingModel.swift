//
//  BookingModel.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 31.08.2023.
//

import Foundation

struct BookingModel: Codable {
    let id: Int
    let hotelName: String
    let hotelAdress: String
    let rating: String
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
    
    private enum CodingKeys: String, CodingKey {
        case id, departure, room, nutrition
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case rating = "horating"
        case ratingName = "rating_name"
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
}
