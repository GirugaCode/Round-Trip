//
//  EmptyWaypointView.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/16/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class EmptyWaypointView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        setupNoWaypoint()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let noTripMessage: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        label.text = "You have not added any waypoints to your trip!"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.3336500525, green: 0.07295330614, blue: 0.3352196217, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var addWaypoint: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func setupNoWaypoint() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(addWaypoint)
        addWaypoint.addArrangedSubview(noTripMessage)
        addWaypoint.addArrangedSubview(getStartedButton)
        NSLayoutConstraint.activate([
            addWaypoint.centerXAnchor.constraint(equalTo: centerXAnchor),
            addWaypoint.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
    
}
