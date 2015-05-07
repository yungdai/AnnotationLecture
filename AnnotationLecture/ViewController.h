//
//  ViewController.h
//  HTTPCommunication
//
//  Created by Kwame Bryan on 2015-05-03.
//  Copyright (c) 2015 Kwame Bryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPCommunication.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>


@property (strong,nonatomic)  HTTPCommunication *http;

@property (strong,nonatomic) MKMapView *mapView;
@end

