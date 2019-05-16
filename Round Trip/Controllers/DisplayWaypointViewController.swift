//
//  DisplayWaypointViewController.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/15/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

/* This View Controller will be able to show you the selected
 waypoint based on what the user selects */

import UIKit
import MapKit

class DisplayWaypointViewController: UIViewController {
    
    var name: String?
    var lat: Double?
    var lon: Double?
    
    private let waypointMap: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupMap()
        setupWaypoint()
    }
    
    private func setupMap() {
        self.title = name
        view.addSubview(waypointMap)
        
        NSLayoutConstraint.activate([
            waypointMap.topAnchor.constraint(equalTo: view.topAnchor),
            waypointMap.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            waypointMap.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            waypointMap.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    private func setupWaypoint() {
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
         let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.lat!, longitude: self.lon!), span: mapSpan)
        
        waypointMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        if let lat = lat, let lon = lon {
            annotation.coordinate.latitude = lat
            annotation.coordinate.longitude = lon
            annotation.title = self.name
        }
        waypointMap.addAnnotation(annotation)
    }

}
