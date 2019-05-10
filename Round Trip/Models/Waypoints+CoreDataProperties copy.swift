//
//  Waypoints+CoreDataProperties.swift
//  
//
//  Created by Ryan Nguyen on 5/9/19.
//
//

import Foundation
import CoreData


extension Waypoints {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Waypoints> {
        return NSFetchRequest<Waypoints>(entityName: "Waypoints")
    }

    @NSManaged public var lat: Double
    @NSManaged public var lon: Double
    @NSManaged public var waypointName: String?
    @NSManaged public var trip: Trips?

}
