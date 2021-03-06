//
//  AppDelegate.m
//  where.is
//
//  Created by Alberto Alonso on 20/12/12.
//  Copyright (c) 2012 Alberto Alonso. All rights reserved.
//

#import "AppDelegate.h"
#import "SecondViewController.h"

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   

    
    UILocalNotification *localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) {
        NSLog(@"Recieved Notification %@",localNotif);
        return YES;
    }
    NSLog(@"paso 1: ",nil);

    // Override point for customization after application launch.
    return YES;
}






- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"paso 2: ",nil);

    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"paso 3: ",nil);

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    [self.viewController saveData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"paso 4: ",nil);

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    [self.viewController loadData];

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"paso 5: ",nil);

    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"paso 6: ",nil);

    [self.viewController saveData];

    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Inside application:didReceiveLocalNotification:"
                                                    message:notification.alertBody
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
 //   [alert show];
}



@end
