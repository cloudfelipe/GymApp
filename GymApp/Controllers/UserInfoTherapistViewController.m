//
//  UserInfoTherapistViewController.m
//  GymApp
//
//  Created by Felipe Correa on 17/06/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "UserInfoTherapistViewController.h"

#import "User.h"

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

#pragma mark - UITableView data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
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
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    
    return cell;
}

#pragma mark - UITableView delegate



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // create the parent view that will hold header Label
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
    
    // create the button object
    UIButton * headerBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    headerBtn.backgroundColor = [UIColor brownColor];
    headerBtn.opaque = NO;
    headerBtn.frame = CGRectMake(10.0, 0.0, 100.0, 30.0);
    [headerBtn setTitle:@"<Put here whatever you want to display>" forState:UIControlEventTouchUpInside];
    [headerBtn addTarget:self action:@selector(ActionEventForButton:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:headerBtn];
    
    return customView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
