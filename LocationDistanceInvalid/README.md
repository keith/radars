# <rdar://23130621>

<http://www.openradar.me/23130621>

Summary:

When getting the distance between 2 `CLLocation`s where one was
initialized with the latitude and longitude from
`kCLLocationCoordinate2DInvalid`, the distance is 0. On OS X the
distance is a very large number, showing that something has gone wrong.

Steps to reproduce:

1. Create 2 locations, one with `kCLLocationCoordinate2DInvalid` and one
   with a valid `CLLocationCoordinate2D`
2. Get the `distanceFromLocation` with the 2 locations.

OR

1. Open the attached playgrounds, one for OS X and one for iOS

Expected results:

On iOS this call should return something that shows that the two
locations do not have identical coordinates.

Actual results:

The locations appear to have the same coordinate.
