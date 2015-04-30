@import CoreLocation;
#import "AppDelegate.h"

@interface AppDelegate () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *manager;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.manager = [CLLocationManager new];
    self.manager.delegate = self;
    if ([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.manager requestWhenInUseAuthorization];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.manager stopUpdatingLocation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self.manager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusNotDetermined) {
        return;
    }

    [manager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"Did update locations");
}

@end
