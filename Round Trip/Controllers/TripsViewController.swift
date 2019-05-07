//
//  TripsViewController.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/7/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    
    var tripsTableView = UITableView()
    
    static var dummyData = ["First","Second","Third"]
    
    private let tableViewCellId = "TripsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addTrip))
        self.navigationItem.rightBarButtonItem = addButton

    }
    
    @objc func addTrip() {
        let addTripsVC = AddTripViewController()
        self.navigationController?.pushViewController(addTripsVC, animated: true)
    }
    
    private func setupTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tripsTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        self.title = "Planned Trips"
        
        tripsTableView.register(TripsTableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
        self.view.addSubview(tripsTableView)
    }

}

extension TripsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(TripsViewController.dummyData[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TripsViewController.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId) as! TripsTableViewCell
        cell.textLabel!.text = "\(TripsViewController.dummyData[indexPath.row])"
        return cell
        
    }

}

