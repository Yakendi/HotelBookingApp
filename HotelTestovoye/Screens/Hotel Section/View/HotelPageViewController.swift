//
//  ViewController.swift
//  HotelTestovoye
//
//  Created by Аслан Микалаев on 30.08.2023.
//

import UIKit
import SnapKit

final class HotelPageViewController: UIViewController {
    
    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .mainGray
        tableView.separatorStyle = .none
        tableView.register(HotelHeaderTableViewCell.self)
        tableView.register(HotelFooterTableViewCell.self)
        return tableView
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - Setup views
private extension HotelPageViewController {
    func setup() {
        setupViews()
        setupTitle()
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.title = "Отель"
    }
}

// MARK: - Table view data source
extension HotelPageViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeue(HotelHeaderTableViewCell.self, indexPath: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeue(HotelFooterTableViewCell.self, indexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
