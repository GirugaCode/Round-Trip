//
//  WaypointTableHeaderView.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/15/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class WaypointTableHeaderView: UITableViewHeaderFooterView {
    
    static let headerViewCellId = "waypointsHeaderViewCellID"
    
    let tripName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.3336500525, green: 0.07295330614, blue: 0.3352196217, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(tripName)
        
        NSLayoutConstraint.activate([
            tripName.centerXAnchor.constraint(equalTo: centerXAnchor),
            tripName.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }


}
