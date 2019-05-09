//
//  NoWaypointsViewController.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/8/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class NoWaypointsViewController: UIViewController {
    
    private lazy var addWaypoint: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [noTripMessage, getStartedButton])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
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
        button.addTarget(self, action: #selector(startWaypoints), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func startWaypoints() {
        print("Start adding Way Points")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNoWaypoint()
    }
    
    private func setupNoWaypoint() {
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.addSubview(addWaypoint)
        
        NSLayoutConstraint.activate([
            addWaypoint.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            addWaypoint.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
    }
}
