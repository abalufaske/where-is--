//
//  AppDelegate.h
//  where.is
//
//  Created by Alberto Alonso on 20/12/12.
//  Copyright (c) 2012 Alberto Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SecondViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (strong, nonatomic) SecondViewController *viewController;



@end
