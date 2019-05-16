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
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        waypointTableView.reloadData()
    }
    
    private func setupTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        waypointTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        self.title = "Trip to: \(allTrips?.tripName ?? "Best Trip Ever!")"
        
        waypointTableView.register(WaypointsTableViewCell.self, forCellReuseIdentifier: WaypointsTableViewCell.tableViewCellId)
        waypointTableView.dataSource = self
        waypointTableView.delegate = self
        self.view.addSubview(waypointTableView)
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(title: "Add Waypoint", style: .plain, target: self, action: #selector(self.addTrip))
        self.navigationItem.rightBarButtonItem = addButton
        
    }
    
    @objc func addTrip() {
        let addWaypointsVC = AddWaypointsViewController()
        guard let unwrappedTrip = self.allTrips else { return }
        addWaypointsVC.currentTrip = unwrappedTrip
        self.navigationController?.pushViewController(addWaypointsVC, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayWaypointVC = DisplayWaypointViewController()
        let selectedWaypoint = allTrips?.waypoint?[indexPath.row] as? Waypoints
        displayWaypointVC.name = selectedWaypoint?.waypointName
        displayWaypointVC.lat = selectedWaypoint?.lat
        displayWaypointVC.lon = selectedWaypoint?.lon
        navigationController?.pushViewController(displayWaypointVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = allTrips?.tripName
        
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
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
