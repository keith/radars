# <rdar://20764660>

<http://www.openradar.me/20764660>

<https://stackoverflow.com/questions/27132698/ios8-blue-bar-is-using-your-location-appears-shortly-after-exiting-app>

Summary:

When the background mode for locations is enabled, and the
`CLLocationManager` has `requestWhenInUseAuthorization` access, the blue
location bar appears after exiting the app. This occurs even when
`stopUpdatingLocation` has been called in either
`applicationDidEnterBackground` or `applicationWillResignActive`.

Steps to reproduce:

1. Enable the background mode for location access
2. `requestWhenInUseAuthorization`
3. Start updating location
4. Stop updating location in either `UIApplicationDelegate` method
5. Put the app in the background

Expected results:

The blue location bar never appears since we are no longer accessing the
user's location.

Actual results:

Note the blue location bar appears immediately and disappears after a
few seconds.

Notes:

This combination of things makes sense when we don't always want to
access the user's location in the background, but do other times (such
as when the user wants directions). You can also reproduce this behavior
using Google Maps on iOS.
