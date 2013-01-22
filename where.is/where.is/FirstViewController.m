//
//  FirstViewController.m
//  where.is
//
//  Created by Alberto Alonso on 20/12/12.
//  Copyright (c) 2012 Alberto Alonso. All rights reserved.
//

#import "FirstViewController.h"
#import "MapViewAnotation.h"

@interface FirstViewController ()





@end

@implementation FirstViewController

@synthesize _mapview;
@synthesize TravelButton;
@synthesize SavePos;
@synthesize MyLocation;




- (void)viewDidLoad
{
    [super viewDidLoad];
  
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

    NSString *latitud = [prefs stringForKey:@"latitude"];
    NSString *longitud = [prefs stringForKey:@"longitude"];
 if(latitud != nil & longitud !=nil)
 {
     
     CLLocationCoordinate2D coordinate;
     coordinate.latitude = [latitud doubleValue];
     coordinate.longitude = [longitud doubleValue];
     MapViewAnotation *newAnnotation = [[MapViewAnotation alloc] initWithTitle:@"Your Spot" andCoordinate:coordinate];
     [_mapview addAnnotation:newAnnotation];
     

 
 
 }
    
  

 
    
    	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    
}




- (IBAction)SavePos:(id)sender {

    
    /*
     con esto borro el pin y dejo solo el user location
     */
    NSMutableArray *locs = [[NSMutableArray alloc] init];
    for (id <MKAnnotation> annot in [_mapview annotations])
    {
        if ( [annot isKindOfClass:[ MKUserLocation class]] ) {
        }
        else {
            [locs addObject:annot];
        }
    }
    [_mapview removeAnnotations:locs];
    locs = nil;

    
    
    
  //  NSNumber *newLat;
  //  NSNumber *newLong;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    // saving a string
    
    NSNumber  *myDoubleNumber = [NSNumber numberWithDouble:_mapview.userLocation.location.coordinate.latitude];
    [prefs setObject:[myDoubleNumber stringValue] forKey:@"latitude"];

    myDoubleNumber = [NSNumber numberWithDouble:_mapview.userLocation.location.coordinate.longitude];
    [prefs setObject:[myDoubleNumber stringValue] forKey:@"longitude"];
    
    
    [prefs setObject:@"sajdaisja" forKey:@"stringVal"];

    
   // double myDouble = [myString doubleValue];
    
    
    // saving a int
    // saving it all
    [prefs synchronize];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = _mapview.userLocation.location.coordinate.latitude;
    coordinate.longitude = _mapview.userLocation.location.coordinate.longitude;
    MapViewAnotation *newAnnotation = [[MapViewAnotation alloc] initWithTitle:@"Buckingham Palace" andCoordinate:coordinate];
    [_mapview addAnnotation:newAnnotation];
   
    
    
    
    
}

- (IBAction)Travel:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    // getting the string
    NSString *stringVal = [prefs stringForKey:@"stringVal"];
    NSString *latitud = [prefs stringForKey:@"latitude"];
    NSString *longitud = [prefs stringForKey:@"longitude"];

    
    NSLog(@"process Name: %@ ",stringVal);
    NSLog(@"latitude: %@ ",latitud);
    NSLog(@"longitude: %@ ",longitud);
    
    

    if(latitud != nil & longitud !=nil)
    {
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = [latitud doubleValue];
        coordinate.longitude = [longitud doubleValue];
        
        // 1
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:coordinate addressDictionary:NULL];
        
        
      
     //   [mapItem openInMapsWithLaunchOptions:nil];


        
        Class itemClass = [MKMapItem class];
        
        if (itemClass && [itemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)]) {
            
            MKMapItem *currentLocationItem = [MKMapItem mapItemForCurrentLocation];
            
            
            MKMapItem *destinamtionLocItem = [[MKMapItem alloc] initWithPlacemark:place];
            
            destinamtionLocItem.name = @"Your Spot";
            
            NSArray *mapItemsArray = [NSArray arrayWithObjects:currentLocationItem, destinamtionLocItem, nil];
            
            NSDictionary *dictForDirections = [NSDictionary dictionaryWithObject:MKLaunchOptionsDirectionsModeDriving forKey:MKLaunchOptionsDirectionsModeKey];
            
            [MKMapItem openMapsWithItems:mapItemsArray launchOptions:dictForDirections];
            
        }
        
   }
    
    
    
    
}

- (IBAction)MyLocation:(id)sender {
    
    // 1
    CLLocationCoordinate2D zoomLocation;
    
  //  zoomLocation.latitude = 39.281516;
  //  zoomLocation.longitude= -76.580806;
  
    zoomLocation.latitude = _mapview.userLocation.location.coordinate.latitude;
      zoomLocation.longitude = _mapview.userLocation.location.coordinate.longitude;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [_mapview regionThatFits:viewRegion];
    // 4
    [_mapview setRegion:adjustedRegion animated:YES];
    
    
    
    
}

- (IBAction)Spot:(id)sender {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

    NSString *latitud = [prefs stringForKey:@"latitude"];
    NSString *longitud = [prefs stringForKey:@"longitude"];
    if(latitud != nil & longitud !=nil)
    {
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = [latitud doubleValue];
        coordinate.longitude = [longitud doubleValue];
        
        // 1
    
        
        // 2
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
        // 3
        MKCoordinateRegion adjustedRegion = [_mapview regionThatFits:viewRegion];
        // 4
        [_mapview setRegion:adjustedRegion animated:YES];
        
    }
     
   
    
}



@end
