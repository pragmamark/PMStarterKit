//
//  PMSKMapKitViewController.h
//  PMStarterKit
//
//  Created by Stefano Zanetti on 05/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface PMSKMapKitViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate>

@property (retain, nonatomic) IBOutlet MKMapView *mapView;
@property (retain, nonatomic) CLLocationManager *locationManager;
@property (retain, nonatomic) CLLocation *currentLocation;

@end
