//
//  HotelFooterTableViewCell.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 31.08.2023.
//

import UIKit
import SnapKit
import TagListView

final class HotelFooterTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfpdM22
        label.text = "Об отеле"
        return label
    }()
    
    private let tagsList: TagListView = {
        let tags = TagListView()
        tags.tagBackgroundColor = .secondGrayTags!
        tags.textColor = .secondGrayText!
        tags.textFont = .sfpdM16!
        tags.cornerRadius = 5
        tags.marginX = 8
        tags.marginY = 8
        tags.paddingX = 10
        tags.paddingY = 5
        tags.addTags(["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"])
        return tags
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .sfpdR16
        label.textColor = .secondBlack
        label.numberOfLines = 0
        label.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
        return label
    }()
    
    // MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        return super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
    }
}

// MARK: - Setup views
private extension HotelFooterTableViewCell {
    func setupViews() {
        contentView.addSubview(wrapperView)
        wrapperView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(4)
        }

        wrapperView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        wrapperView.addSubview(tagsList)
        tagsList.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }

        wrapperView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(tagsList.snp.bottom).offset(12)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
