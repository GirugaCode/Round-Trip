//
//  Trips+CoreDataProperties.swift
//  
//
//  Created by Ryan Nguyen on 5/9/19.
//
//

import Foundation
import CoreData


extension Trips {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trips> {
        return NSFetchRequest<Trips>(entityName: "Trips")
    }

    @NSManaged public var tripName: String?
    @NSManaged public var waypoint: Waypoints?

}
