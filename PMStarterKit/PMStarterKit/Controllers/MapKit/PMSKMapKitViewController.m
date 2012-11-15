//
//  PMSKMapKitViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 05/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKMapKitViewController.h"
#import "PMSKMyLocation.h"

@interface PMSKMapKitViewController ()

@end

@implementation PMSKMapKitViewController

#pragma mark -
#pragma mark View life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.showsUserLocation = YES;
    
    UIBarButtonItem *buttonFindMe = [[UIBarButtonItem alloc] initWithTitle:@"Find Me"
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self
                                                                    action:@selector(_findMe:)];
    self.navigationItem.rightBarButtonItem = buttonFindMe;
    
    [buttonFindMe release];
    
    self.locationManager = [[[CLLocationManager alloc] init] autorelease];
    self.locationManager.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 45.541187;
    zoomLocation.longitude= 10.219444;

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1000, 1000);
    
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];

    [_mapView setRegion:adjustedRegion animated:YES];
    
    
    PMSKMyLocation *location = [[PMSKMyLocation alloc] initWithName:@"Brescia"
                                                            address:@"Città bellissima!!!"
                                                         coordinate:zoomLocation];
 
    [_mapView addAnnotation:location];
    [location release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_mapView release];
    [_locationManager release];
    [_currentLocation release];
    
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
}

#pragma mark -
#pragma mark Private methods

- (void) _findMe:(id)sender
{
    [_locationManager startUpdatingLocation];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.currentLocation = newLocation;
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = self.currentLocation.coordinate.latitude;
    zoomLocation.longitude= self.currentLocation.coordinate.longitude;

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1000, 1000);

    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];

    [_mapView setRegion:adjustedRegion animated:YES];
    
    NSLog(@"Horizontal Accurancy: %f", newLocation.horizontalAccuracy);
    
    if(newLocation.horizontalAccuracy <= 100.0f)
    {
        [_locationManager stopUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied)
    {
        [_locationManager stopUpdatingLocation];
    } else if (error.code == kCLErrorLocationUnknown)
    {
    // retry
    } else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error retrieving location"
                                                    message:[error description]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
