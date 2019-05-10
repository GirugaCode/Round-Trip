//
//  AddWaypointsViewController.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/9/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

/* The View Controller with the ability to add waypoints to a trip with MapKit. */

import GooglePlaces
import MapKit
import UIKit

class AddWaypointsViewController: UIViewController {
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
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

        setupMap()
        setupSearchBar()
    }
    
    private func setupMap() {
        self.title = "Add Waypoint"
        view.addSubview(waypointMap)
        
        NSLayoutConstraint.activate([
            waypointMap.topAnchor.constraint(equalTo: view.topAnchor),
            waypointMap.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            waypointMap.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            waypointMap.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    private func setupSearchBar() {
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let subView = UIView(frame: CGRect(x: 0, y: 88.0, width: 350.0, height: 45.0))
        
        subView.addSubview((searchController?.searchBar)!)
        waypointMap.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        
        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true
        
        // This makes the view area include the nav bar even though it is opaque.
        // Adjust the view placement down.
        self.extendedLayoutIncludesOpaqueBars = true
        self.edgesForExtendedLayout = .top
    }

}

extension AddWaypointsViewController : MKMapViewDelegate {
    
}

// Handle the user's selection.
extension AddWaypointsViewController: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        // Do something with the selected place.
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
