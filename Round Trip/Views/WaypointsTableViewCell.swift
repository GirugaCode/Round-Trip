//
//  WaypointsTableViewCell.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/15/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class WaypointsTableViewCell: UITableViewCell {

    static let tableViewCellId = "waypointsTableViewCellID"
    
    let tripLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.3336500525, green: 0.07295330614, blue: 0.3352196217, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // - MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(tripLabel)
        
        NSLayoutConstraint.activate([
            tripLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tripLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}
