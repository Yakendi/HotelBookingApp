//
//  Coordinator.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 30.08.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}
