//
//  rutineListTableViewController.h
//  GymApp
//
//  Created by Felipe Correa on 16/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface rutineListTableViewController : UITableViewController


@property (nonatomic, strong) User* currentUser;

- (IBAction)saveRoutine:(id)sender;
- (IBAction)closeBtn:(id)sender;


@end
