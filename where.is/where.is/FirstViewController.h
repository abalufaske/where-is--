//
//  FirstViewController.h
//  where.is
//
//  Created by Alberto Alonso on 20/12/12.
//  Copyright (c) 2012 Alberto Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface FirstViewController : UIViewController
{
}

@property (weak, nonatomic) IBOutlet UIButton *MyLocation;
@property (weak, nonatomic) IBOutlet UIButton *SavePos;
@property (weak, nonatomic) IBOutlet UIButton *TravelButton;

@property (weak, nonatomic) IBOutlet MKMapView *_mapview;



- (IBAction)SavePos:(id)sender;
- (IBAction)Travel:(id)sender;
- (IBAction)MyLocation:(id)sender;
- (IBAction)Spot:(id)sender;



@end
