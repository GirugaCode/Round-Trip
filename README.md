# Round Trip

Round Trip is here to help you organize your next big trip! You can add waypoints and keep track of where you want to go!


## Tech Stack

* [Swift 4.2](https://developer.apple.com/swift/)
* [Xcode 10.1](https://developer.apple.com/xcode/)
* [Core Data](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/index.html)
* [CocoaPods](https://guides.cocoapods.org/terminal/commands.html)
* [Apple's CoreLocation API](https://developer.apple.com/documentation/corelocation)

## Features
- Users can _create_ trip by providing a name
- Trips can have a collection of Waypoints (the collection may be empty)
- Waypoints are represented by a geographic coordinate and a name
- Users can _add_ Waypoints to trips by searching the Google Places API for a location name
- Waypoints are _displayed_ on a map
- Users can _remove_ Waypoints
- Users can _remove_ Trips
- Core Data is used to persist all Trips and Waypoints
- Save user settings using any simple persistence method of your preference.
- For example: distance metrics, currency selector, dark mode preference...
- _These features don't need to work_, you just want to demonstrate the case of saving simple data.
