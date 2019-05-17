//
//  TripsViewController.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/7/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

/* The initial View Controller for viewing all of the trips you currently have.*/

import UIKit
import CoreData

class MainTripsViewController: UIViewController {
    
    var tripsTableView = UITableView()
    
    var tripNames = [Trips]() {
        didSet {
            tripsTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tripNames = CoreDataManager.getTrips()
    }
    
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
        
        tripsTableView.register(TripsTableViewCell.self, forCellReuseIdentifier: TripsTableViewCell.tableViewCellId)
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
        self.view.addSubview(tripsTableView)
    }

}

extension MainTripsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tripCell = tripsTableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.tableViewCellId, for: indexPath) as! TripsTableViewCell
        
        let currentTrip = tripNames[indexPath.row]
        tripCell.tripLabel.text = currentTrip.tripName
        
        return tripCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.navigationController?.pushViewController(NoWaypointsViewController(), animated: true)
        
        // If the trip has way points, push to WaypointsViewController
        let waypointVC = WaypointsViewController()
        waypointVC.allTrips = tripNames[indexPath.row]
        self.navigationController?.pushViewController(waypointVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedTrip = self.tripNames[indexPath.row]
            CoreDataManager.deleteTrip(trip: selectedTrip)
            tripsTableView.reloadData()
        }
    }

}

