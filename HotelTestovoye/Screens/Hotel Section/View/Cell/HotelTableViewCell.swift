//
//  HotelTableViewCell.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 31.08.2023.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    
    // MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
