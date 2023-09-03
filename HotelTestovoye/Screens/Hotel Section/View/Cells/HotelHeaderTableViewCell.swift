//
//  HotelHeaderTableViewCell.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 31.08.2023.
//

import UIKit
import SnapKit

final class HotelHeaderTableViewCell: UITableViewCell {

    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let wrapperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.backgroundColor = .systemBackground
        view.clipsToBounds = true
        return view
    }()
    
    private let hotelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.backgroundColor = .mainOrange
        return imageView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.layer.cornerRadius = 5
        pageControl.clipsToBounds = true
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .systemBackground
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .mainGray
        return pageControl
    }()
    
    // rating
    private let ratingWrapperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.backgroundColor = .secondOrange
        return view
    }()
    
    private let ratingStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ratingStar")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .mainOrange
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "5 Превосходно"
        label.font = .sfpdM16
        label.textColor = .mainOrange
        return label
    }()
    
    private let ratingNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // hotel description
    private let hotelNameLabel: UILabel = {
        let label = UILabel()
        label.font = .sfpdM22
        label.text = "Steigenberger Makadi"
        return label
    }()
    
    private let hotelAdressButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .sfpdM14
        button.setTitleColor(.mainBlue, for: .normal)
        button.setTitle("Madinat Makadi, Safaga Road, Makadi Bay, Египет", for: .normal)
        return button
    }()
    
    private let hotelPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .sfpdS30
        label.text = "от 134 673 ₽"
        return label
    }()
    
    private let priceForItLabel: UILabel = {
        let label = UILabel()
        label.font = .sfpdR16
        label.textColor = .secondGrayText
        label.text = "за тур с перелётом"
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
}

private extension HotelHeaderTableViewCell {
    func setupViews() {
        contentView.addSubview(wrapperView)
        wrapperView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-4)
        }
        
        wrapperView.addSubview(hotelImageView)
        hotelImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(257)
        }
        
        hotelImageView.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(17)
        }
        
        // rating
        wrapperView.addSubview(ratingWrapperView)
        ratingWrapperView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(hotelImageView.snp.bottom).offset(16)
        }
        
        ratingWrapperView.addSubview(ratingStarImageView)
        ratingStarImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(7)
            make.bottom.equalToSuperview().offset(-7)
            make.width.height.equalTo(15)
        }
        
        ratingWrapperView.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.leading.equalTo(ratingStarImageView.snp.trailing).offset(2)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        
        // hotel description
        wrapperView.addSubview(hotelNameLabel)
        hotelNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(hotelImageView.snp.leading)
            make.top.equalTo(ratingWrapperView.snp.bottom).offset(8)
            make.trailing.equalTo(hotelImageView.snp.trailing)
        }
        
        wrapperView.addSubview(hotelAdressButton)
        hotelAdressButton.snp.makeConstraints { make in
            make.leading.equalTo(hotelNameLabel.snp.leading)
            make.top.equalTo(hotelNameLabel.snp.bottom).offset(8)
        }
        
        wrapperView.addSubview(hotelPriceLabel)
        hotelPriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(hotelNameLabel.snp.leading)
            make.top.equalTo(hotelAdressButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        wrapperView.addSubview(priceForItLabel)
        priceForItLabel.snp.makeConstraints { make in
            make.leading.equalTo(hotelPriceLabel.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(-19)
            make.trailing.equalToSuperview().offset(-16).priority(.low)
        }
    }
}
