//
//  UIViewController + extensions.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 02.09.2023.
//

import UIKit

extension UIViewController {
    func setupNavigationBar() {
        setupBackButton()
        setupTitle()
    }
    
    func setupBackButton() {
        let backButton = UIImage(named: "backButton")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButton, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func setupTitle() {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.sfpdM18]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
