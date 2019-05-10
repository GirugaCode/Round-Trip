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
    @NSManaged public var waypoint: NSOrderedSet?

}

// MARK: Generated accessors for waypoint
extension Trips {

    @objc(insertObject:inWaypointAtIndex:)
    @NSManaged public func insertIntoWaypoint(_ value: Waypoints, at idx: Int)

    @objc(removeObjectFromWaypointAtIndex:)
    @NSManaged public func removeFromWaypoint(at idx: Int)

    @objc(insertWaypoint:atIndexes:)
    @NSManaged public func insertIntoWaypoint(_ values: [Waypoints], at indexes: NSIndexSet)

    @objc(removeWaypointAtIndexes:)
    @NSManaged public func removeFromWaypoint(at indexes: NSIndexSet)

    @objc(replaceObjectInWaypointAtIndex:withObject:)
    @NSManaged public func replaceWaypoint(at idx: Int, with value: Waypoints)

    @objc(replaceWaypointAtIndexes:withWaypoint:)
    @NSManaged public func replaceWaypoint(at indexes: NSIndexSet, with values: [Waypoints])

    @objc(addWaypointObject:)
    @NSManaged public func addToWaypoint(_ value: Waypoints)

    @objc(removeWaypointObject:)
    @NSManaged public func removeFromWaypoint(_ value: Waypoints)

    @objc(addWaypoint:)
    @NSManaged public func addToWaypoint(_ values: NSOrderedSet)

    @objc(removeWaypoint:)
    @NSManaged public func removeFromWaypoint(_ values: NSOrderedSet)

}
