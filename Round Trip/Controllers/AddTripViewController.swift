//
//  AddTripViewController.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/7/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    
    private lazy var addTripFeature: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [promptMessage, tripTextField, emptyTrip])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let promptMessage: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 24)
        label.text = "Give this trip a name!"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.3336500525, green: 0.07295330614, blue: 0.3352196217, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emptyTrip: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 24)
        label.text = "Please enter a trip name!"
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let tripTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Your next Adventure!"
        textField.font = UIFont(name: "Avenir-Heavy", size: 16)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupAddTrip()
        
        
    }

    private func setupNavigationBar() {
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelAdd))
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addTrip))
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func cancelAdd() {
        print("Cancel")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addTrip() {
        print("Added the trip")
        // Using the static dummyData to append w/e the text field would be
        guard let text = tripTextField.text, !text.isEmpty else {
            emptyTrip.isHidden = false
            return
        }
        TripsViewController.dummyData.append(text)
        self.navigationController?.initRootViewController(vc: TripsViewController())
    }
    
    private func setupAddTrip() {
        self.title = "Add Trip"
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view.addSubview(addTripFeature)
        
        NSLayoutConstraint.activate([
            addTripFeature.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            addTripFeature.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
    }
    
}
