//
//  CoreDataManager.swift
//  Round Trip
//
//  Created by Ryan Nguyen on 5/9/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import CoreData
import UIKit

class CorDataManager {
    
    static let managedContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        let persistanceContainer = appDelegate.persistentContainer
        let context = persistanceContainer.viewContext
        return context
    }()
    
    class func addTrip(sender: Notification) {
        let entity = NSEntityDescription.entity(forEntityName: "Trips", in: managedContext)!
        let trip = NSManagedObject(entity: entity, insertInto: managedContext)
        trip.setValue(sender.object, forKey: "tripName")
        
        saveTrip()
    }
    
    class func saveTrip() {
        do {
            try managedContext.save()
        } catch let error{
            print("Unable to save \(error.localizedDescription)")
        }
    }
    
    class func deleteTrip(trip: NSManagedObject) {
        managedContext.delete(trip)
        saveTrip()
    }
    
    class func getTrips() -> [Trips] {
        do {
            let fetchRequests = NSFetchRequest<Trips>(entityName: "Trips")
            let results = try managedContext.fetch(fetchRequests)
            return results
        } catch let error {
            print("Unable to fetch data \(error.localizedDescription)")
            return []
        }
    }
}
