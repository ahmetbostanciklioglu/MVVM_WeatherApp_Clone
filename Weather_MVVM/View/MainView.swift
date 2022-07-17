//
//  MainView.swift
//  Weather_MVVM
//
//  Created by Ahmet Bostancıklıoğlu on 12.07.2022.
//

import UIKit

class MainView: UIView {
    
    lazy var cityListTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 50
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(cityListTableView)
        setUpConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        cityListTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cityListTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cityListTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cityListTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}

