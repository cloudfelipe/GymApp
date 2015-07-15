//
//  UserInfoTherapistViewController.m
//  GymApp
//
//  Created by Felipe Correa on 17/06/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "UserInfoTherapistViewController.h"

#import "User.h"
#import "CorporalSummary.h"

#import "AppDelegate.h"



@interface UserInfoTherapistViewController (){
    NSArray* userCorporalSummaries;
}

@end

@implementation UserInfoTherapistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _birthdayLB.text = [NSDateFormatter localizedStringFromDate:_anUser.birthday
                                                      dateStyle:NSDateFormatterShortStyle
                                                      timeStyle:NSDateFormatterNoStyle];
    _nameAndLastnameLB.text = [NSString stringWithFormat:@"%@ %@", _anUser.name, _anUser.lastsname];
    _emailLB.text = _anUser.email;
    _phoneLB.text = [NSString stringWithFormat:@"%ld", (long)_anUser.phone];
    _occupationLB.text = _anUser.occupation;
    
    userCorporalSummaries = [_anUser.corporalsummaries allObjects];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegate

-(void)CorporalSummaryTableViewControllerDidSave:(CorporalSummaryTableViewController *)controller didNewCorporalSummary:(CorporalSummary *)aNewCorporalSummary{
    
    [self.anUser addCorporalsummariesObject:aNewCorporalSummary];
    
    userCorporalSummaries = [self.anUser.corporalsummaries allObjects];
    
    aNewCorporalSummary.owner = self.anUser;
    
    //Save data db
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Nooo, error al grabar: %@", [error localizedDescription]);
    }else{
        // do whatever you want with the results - you can access specific values from the dictionary using
        // the key you provided when you created the form
        NSLog(@"info updated");
    }
    
    [self.summaryCorporalTableview reloadData];
}

#pragma mark - UITableView data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return userCorporalSummaries.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"sumaryCorporalCell";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Set up the cell...
    //User *user = [self.users objectAtIndex:indexPath.row];
    
//    UILabel* nameLb = (UILabel*)[cell viewWithTag:1];
//    nameLb.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    //NSLog(@"%ld",(long)[user.birthday da]);
    //    cell.textLabel.text = user.name;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm"];
    
    CorporalSummary* corpSum = [userCorporalSummaries objectAtIndex:indexPath.row];
    NSString *theDate = [dateFormat stringFromDate:corpSum.date];
    NSString *theTime = [timeFormat stringFromDate:corpSum.date];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Resumen corporal: %@ - %@", theDate, theTime];
    
    
    
    return cell;
}

#pragma mark - UITableView delegate

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    
//    // create the parent view that will hold header Label
//    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
//    
//    // create the button object
//    UIButton * headerBtn = [[UIButton alloc] initWithFrame:CGRectZero];
//    headerBtn.backgroundColor = [UIColor brownColor];
//    headerBtn.opaque = NO;
//    headerBtn.frame = CGRectMake(10.0, 0.0, 100.0, 30.0);
//    [headerBtn setTitle:@"<Put here whatever you want to display>" forState:UIControlEventTouchUpInside];
//    [headerBtn addTarget:self action:@selector(ActionEventForButton:) forControlEvents:UIControlEventTouchUpInside];
//    [customView addSubview:headerBtn];
//    
//    return customView;
//}

//- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 100.0;
//}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"corporalSummarySegue"]) {
        //Set the delegate for ProfileViewCtlr
        UINavigationController *navController = [segue destinationViewController];
        CorporalSummaryTableViewController *corpCtrl = (CorporalSummaryTableViewController *)([navController viewControllers][0]);
        corpCtrl.delegate = self;
    }
}


- (IBAction)newCorpSumBtn:(id)sender {
    [self performSegueWithIdentifier:@"corporalSummarySegue" sender:nil];
}

- (IBAction)closeBtn:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
