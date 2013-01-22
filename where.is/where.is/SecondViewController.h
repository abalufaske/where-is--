//
//  SecondViewController.h
//  where.is
//
//  Created by Alberto Alonso on 20/12/12.
//  Copyright (c) 2012 Alberto Alonso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *color;

@property (weak, nonatomic) IBOutlet UITextField *floor;
@property (weak, nonatomic) IBOutlet UITextField *number;

@property (weak, nonatomic) IBOutlet UITextField *section;

@property (weak, nonatomic) IBOutlet UILabel *FloorLabel;
@property (weak, nonatomic) IBOutlet UILabel *ColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *NumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *SectionLabel;

// Methods
-(NSString *) getFilePath;
-(void) saveData;
-(void) loadData;


- (IBAction)safe:(id)sender;
- (IBAction)cleardata:(id)sender;
- (IBAction)dismisskeyboard:(id)sender;

@end
