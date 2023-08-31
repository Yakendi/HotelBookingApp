//
//  ServiceFactory.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 31.08.2023.
//

import Foundation

final class ServiceFactory {
    
    // MARK: - Singleton
    static let shared = ServiceFactory()
    
    // MARK: - Public
    let networkLayer: NetworkLayer
    
    // MARK: - Constructor
    init(networkLayer: NetworkLayer = .init()) {
        self.networkLayer = networkLayer
    }
    
    // MARK: - Requests
    func hotelsList(completion: @escaping Handler<HotelsModel>) {
        networkLayer.makeRequest(to: .hotels(), completion: completion)
    }
    
    func roomsList(completion: @escaping Handler<RoomsModel>) {
        networkLayer.makeRequest(to: .rooms(), completion: completion)
    }
    
    func booking(completion: @escaping Handler<BookingModel>) {
        networkLayer.makeRequest(to: .book(), completion: completion)
    }
}
