//
//  ViewController.m
//  HTTPCommunication
//
//  Created by Kwame Bryan on 2015-05-03.
//  Copyright (c) 2015 Kwame Bryan. All rights reserved.
//

#import "ViewController.h"
#import "HTTPCommunication.h"
#import "Annotation.h"

@interface ViewController () {
    
    NSNumber *responseID;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _http = [[HTTPCommunication alloc]init];
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_mapView];
    [self getJoke];
}
- (void)getJoke {
    
    //Creating an instance of your recently created IAHTTPCommunication class
    
    /*Retrieving jokes using the HTTP- Communicationinstance*/
    NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
    [_http retrieveURL:url successBlock:^(NSData * response) {
        
        NSError *error = nil;
        /*Deserializing the
         information you got from the API*/
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        NSArray *stationResults = [data objectForKey:@"stationBeanList"];
        NSLog(@"%@",stationResults);
        // fast enumeration
        for (NSDictionary *dictionaries in stationResults)
        {
            // storing longtitude
            NSNumber *longitude = dictionaries[@"longitude"];
            NSNumber *latitude = dictionaries[@"latitude"];
            // create an array of objects
            NSArray *myData = [NSMutableArray arrayWithObjects:longitude,latitude, nil];
            NSMutableArray *objectOfObjects = [[NSMutableArray alloc]initWithArray:myData copyItems:YES];
            // debug this value
            NSLog(@"%@",objectOfObjects[0]);
            NSLog(@"%@",objectOfObjects[1]);
            CLLocationCoordinate2D annotationCoordinate = CLLocationCoordinate2DMake([objectOfObjects[1] floatValue], [objectOfObjects[0]floatValue]);
            // allocate an annotation object
            Annotation *annotation = [[Annotation alloc] init];
            // pass the value of the annotation coordinate
            annotation.coordinate = annotationCoordinate;
            [self.mapView addAnnotation:annotation];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
