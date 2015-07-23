//
//  UsersTableViewController.m
//  GymApp
//
//  Created by Felipe Correa on 18/05/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "UsersTableViewController.h"

#import "User.h"
#import "AppDelegate.h"

#import "UserInfoTherapistViewController.h"

#import "rutineListTableViewController.h"

@interface UsersTableViewController ()<UIActionSheetDelegate>{
    User * userSelected;
}

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    
    self.users = [context executeFetchRequest:fetchRequest error:&error];
    self.title = @"Usuarios";
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundColor = [UIColor blackColor];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"userCellIdentifier";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Set up the cell...
    User *user = [self.users objectAtIndex:indexPath.row];
    
    NSString *dateString = [NSDateFormatter localizedStringFromDate:user.birthday
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterNoStyle];
    NSLog(@"%@",dateString);
    
    UILabel* nameLb = (UILabel*)[cell viewWithTag:1];
    nameLb.text = [NSString stringWithFormat:@"%@ %@", user.name, user.lastsname];
    
    //NSLog(@"%ld",(long)[user.birthday da]);
//    cell.textLabel.text = user.name;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", user.lastsname];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


#pragma mark - UITableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    userSelected = [self.users objectAtIndex:[indexPath row]];
    
    if (self.isADoctorLogined) {
        [self performSegueWithIdentifier:@"userInfoTherapistSegue" sender:nil];
    }else{
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"¿Qué acción deseas hacer?"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancelar"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Crear Rutina", @"Ver Resumen Corporal", nil];
        [actionSheet showInView:self.view];
    }
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        [self performSegueWithIdentifier:@"userRutineSegue" sender:nil];
    }else{
        //Ver resumen corporal view
    }
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"userInfoTherapistSegue"]) {
        UserInfoTherapistViewController* userInfoCtrl = (UserInfoTherapistViewController*)[(UINavigationController*)[segue destinationViewController] topViewController];
        userInfoCtrl.anUser = userSelected;
    }else if ([segue.identifier isEqualToString:@"userRutineSegue"]){
        
        UINavigationController* navCtrl = [segue destinationViewController];
        
        rutineListTableViewController* routineList = (rutineListTableViewController*)[navCtrl topViewController];
        routineList.currentUser = userSelected;
    }
    
    
}


- (IBAction)closeBtn:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
