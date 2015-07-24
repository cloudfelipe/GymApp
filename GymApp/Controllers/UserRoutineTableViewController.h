//
//  UserRoutineTableViewController.h
//  GymApp
//
//  Created by Felipe Correa on 23/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Routine;

@interface UserRoutineTableViewController : UITableViewController

@property (nonatomic, strong) Routine* currentRoutine;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeBtn;
- (IBAction)closeBtn:(id)sender;

@end
