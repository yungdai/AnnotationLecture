//
//  Annotation.h
//  HTTPCommunication
//
//  Created by Kwame Bryan on 2015-05-07.
//  Copyright (c) 2015 Kwame Bryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property CLLocationCoordinate2D coordinate;

@end
