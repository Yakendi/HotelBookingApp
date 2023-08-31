//
//  AppCoordinator.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 30.08.2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: - Public
    var navigationController = UINavigationController()
    
    // MARK: - Private
    private let window: UIWindow
    
    // MARK: - Constructor
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let controller = HotelPageViewFactory.create()
        navigationController.setViewControllers([controller], animated: false)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
