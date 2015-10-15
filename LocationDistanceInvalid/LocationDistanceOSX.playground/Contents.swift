import CoreLocation

let firstCoordinate = CLLocationCoordinate2D(latitude: 10, longitude: 10)
let secondCoordinate = kCLLocationCoordinate2DInvalid

let firstLocation = CLLocation(latitude: firstCoordinate.latitude, longitude: firstCoordinate.longitude)
let secondLocation = CLLocation(latitude: secondCoordinate.latitude, longitude: secondCoordinate.longitude)

firstLocation.distanceFromLocation(secondLocation)
