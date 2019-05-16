//
//  WaypointsViewController.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/8/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

/* The View Controller to display all the Waypoints your trip currently has.*/

import UIKit

class WaypointsViewController: UIViewController {
    
    var allTrips: Trips?
    
    var waypointTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    private func setupTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        waypointTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        self.title = "Way Points"
        
        waypointTableView.register(WaypointsTableViewCell.self, forCellReuseIdentifier: WaypointsTableViewCell.tableViewCellId)
        waypointTableView.dataSource = self
        waypointTableView.delegate = self
        self.view.addSubview(waypointTableView)
    }
}

extension WaypointsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTrips?.waypoint?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayWaypoints = allTrips?.waypoint?[indexPath.row] as? Waypoints
        let cell = tableView.dequeueReusableCell(withIdentifier: WaypointsTableViewCell.tableViewCellId, for: indexPath)
        cell.textLabel?.text = displayWaypoints?.waypointName
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let displayWaypoints = allTrips?.waypoint?[indexPath.row] as? Waypoints
        if editingStyle == .delete {
            CoreDataManager.managedContext.delete(displayWaypoints!)
            CoreDataManager.saveTrip()
            tableView.reloadData()
        }
    }
    
}
