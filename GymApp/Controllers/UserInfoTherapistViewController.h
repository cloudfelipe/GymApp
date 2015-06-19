//
//  UserInfoTherapistViewController.h
//  GymApp
//
//  Created by Felipe Correa on 17/06/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "ViewController.h"

#import "CorporalSummaryTableViewController.h"

@class User;

@interface UserInfoTherapistViewController : ViewController <UITableViewDataSource, UITableViewDelegate, CorporalSummaryCtrlDelegate>

/**
 *  Outlets
 */

@property (weak, nonatomic) IBOutlet UILabel *nameAndLastnameLB;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLB;
@property (weak, nonatomic) IBOutlet UILabel *emailLB;
@property (weak, nonatomic) IBOutlet UILabel *phoneLB;
@property (weak, nonatomic) IBOutlet UILabel *occupationLB;
@property (weak, nonatomic) IBOutlet UITableView *summaryCorporalTableview;


/**
 * Properties
 */

@property (nonatomic, strong) User* anUser;

- (IBAction)newCorpSumBtn:(id)sender;

@end
