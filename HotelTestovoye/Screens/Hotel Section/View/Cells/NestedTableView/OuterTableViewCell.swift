//
//  TableTableViewCell.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 13.09.2023.
//

import UIKit
import SnapKit

final class OuterTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    var dataArray: [InnerCellContentModel] = [
        InnerCellContentModel(title: "Удобства", subtitle: "Самое необходимое", image: UIImage(named: "emoji.happy.square") ?? UIImage()),InnerCellContentModel(title: "Что включено", subtitle: "Самое необходимое", image: UIImage(named: "tick.square") ?? UIImage()),InnerCellContentModel(title: "Что не включено", subtitle: "Самое необходимое", image: UIImage(named: "close.square") ?? UIImage())
    ]
    
    // MARK: - UI
    private let wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InnerTableViewCell.self)
        return tableView
    }()

    // MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup views
private extension OuterTableViewCell {
    func setupViews() {
        contentView.addSubview(wrapperView)
        wrapperView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
        
        wrapperView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview()
            make.trailing.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(212)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Table view
extension OuterTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(InnerTableViewCell.self, indexPath: indexPath)
        let selected = dataArray[indexPath.row]
        cell.configure(selected)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let isLastCell = indexPath.row == dataArray.count - 1
        
        if isLastCell {
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.width, bottom: 0, right: 0)
        }
    }
}
