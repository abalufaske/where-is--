//
//  SecondViewController.m
//  where.is
//
//  Created by Alberto Alonso on 20/12/12.
//  Copyright (c) 2012 Alberto Alonso. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize color,floor,number,section,FloorLabel,ColorLabel,SectionLabel,NumberLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
    self.FloorLabel.text = NSLocalizedString(@"FLOOR", nil);
    self.ColorLabel.text = NSLocalizedString(@"COLOR", nil);
    self.NumberLabel.text = NSLocalizedString(@"NUMBER", nil);
    self.SectionLabel.text = NSLocalizedString(@"SECTION", nil);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"paso 12: ",nil);

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)safe:(id)sender {
    
    [self saveData];
    
   UILocalNotification *notification = [[UILocalNotification alloc] init];

    // debe de activarse dentro de 5 segundos
    notification.fireDate = [[NSDate alloc] initWithTimeIntervalSinceNow:1];
    
    NSString *s = @"Parking  ";
    s = [s stringByAppendingString:NSLocalizedString(@"COLOR", nil)];
    s = [s stringByAppendingString:@"  :"];

    s = [s stringByAppendingString:color.text];
    s = [s stringByAppendingString:@" - "];

    s = [s stringByAppendingString:NSLocalizedString(@"FLOOR", nil)];
    s = [s stringByAppendingString:@"  :"];
    s = [s stringByAppendingString:floor.text];
    s = [s stringByAppendingString:@" - "];
    
    s = [s stringByAppendingString:NSLocalizedString(@"NUMBER", nil)];
    s = [s stringByAppendingString:@"  :"];
    s = [s stringByAppendingString:number.text];

    s = [s stringByAppendingString:@" - "];
    
    s = [s stringByAppendingString:NSLocalizedString(@"SECTION", nil)];
    s = [s stringByAppendingString:@"  :"];
    s = [s stringByAppendingString:section.text];

    // mensaje que saldrá en la alerta
    notification.alertBody = s;
    
    // sonido por defecto
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    // título del botón
    notification.hasAction = YES;
    
    // activa la notificación
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

- (IBAction)cleardata:(id)sender {
    color.text = @"";
    floor.text = @"";
    
    number.text = @"";
    
    section.text = @"";
    
}

- (IBAction)dismisskeyboard:(id)sender {
    [color resignFirstResponder];
    [number resignFirstResponder];
    [section resignFirstResponder];
    [floor resignFirstResponder];


}

- (NSString *) getFilePath {
    // placeholder
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathArray objectAtIndex:0] stringByAppendingPathComponent:@"saved.plist"];
    
}


-(void) saveData {
    NSLog(@"paso save: ",nil);

    // save data here
    NSArray *value = [[NSArray alloc] initWithObjects:[color text],[floor text],[number text],[section text], nil];
    [value writeToFile:[self getFilePath] atomically:YES];
}

- (void) loadData {
    // load data here
    NSLog(@"paso load: ",nil);

    NSString *myPath = [self getFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
    if (fileExists) {
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
        color.text = [values objectAtIndex:0];
        floor.text = [values objectAtIndex:1];

        number.text = [values objectAtIndex:2];

        section.text = [values objectAtIndex:3];
}
}


@end
