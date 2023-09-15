//
//  ContentTableViewCell.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 13.09.2023.
//

import UIKit
import SnapKit

final class InnerTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let contentImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let indicatorImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "arrow.right")
        return image
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfpdM16
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfpdM14
        label.textColor = .secondGrayText
        return label
    }()

    // MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .secondGrayTags
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0, left: 53, bottom: 0, right: 15)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: InnerCellContentModel) {
        contentImageView.image = model.image
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}

// MARK: - Setup views
private extension InnerTableViewCell {
    func setupViews() {
        contentView.addSubview(contentImageView)
        contentImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(contentImageView.snp.trailing).offset(12)
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        contentView.addSubview(indicatorImageView)
        indicatorImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
            make.height.width.equalTo(24)
        }
    }
}
