//
//  MapViewAnotation.m
//  where.is
//
//  Created by Alberto Alonso on 18/01/13.
//  Copyright (c) 2013 Alberto Alonso. All rights reserved.
//

#import "MapViewAnotation.h"

@implementation MapViewAnotation

@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	title = ttl;
	coordinate = c2d;
	return self;
}


@end