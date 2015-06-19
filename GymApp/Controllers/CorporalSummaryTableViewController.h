//
//  CorporalSummaryTableViewController.h
//  GymApp
//
//  Created by Felipe Correa on 17/06/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CorporalSummaryTableViewController;
@class CorporalSummary;

@protocol CorporalSummaryCtrlDelegate <NSObject>

@optional

-(void) CorporalSummaryTableViewControllerDidSave: (CorporalSummaryTableViewController*) controller didNewCorporalSummary: (CorporalSummary*) aNewCorporalSummary;

@end

@interface CorporalSummaryTableViewController : UITableViewController

//Delegate
@property (nonatomic, weak) id <CorporalSummaryCtrlDelegate> delegate;

//Section1
@property (weak, nonatomic) IBOutlet UITableViewCell *armTCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *thighTCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *thoraxTCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *waistTCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *weightTCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *cardialFrecTCell;

//Section2
@property (weak, nonatomic) IBOutlet UITableViewCell *trainerTCell;

//Section3
@property (weak, nonatomic) IBOutlet UITableViewCell *notesTCell;

//Actions

- (IBAction)saveBtn:(id)sender;

- (IBAction)cancelBtn:(id)sender;


@end
