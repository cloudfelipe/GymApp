//
//  UserRoutineTableViewController.m
//  GymApp
//
//  Created by Felipe Correa on 23/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "UserRoutineTableViewController.h"
#import "UserRoutineExerciseTableViewController.h"

#import "AppDelegate.h"
#import "Routine.h"

@interface UserRoutineTableViewController (){
    
    
    AppDelegate* appDelegate;
    
    NSArray* exerciseList;
}

@end

@implementation UserRoutineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MI RUTINA";
    
    exerciseList = @[@"PECHO",@"ESPALDA",@"HOMBROS",@"BICEPS",@"TRICEPS",@"MUSLO",@"CADERA",@"PIERNA",@"ABDOMEN - CINTURA"];
    
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
    return [exerciseList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [exerciseList objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"excersiceCtrl" sender:[NSNumber numberWithInteger:indexPath.row]];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UserRoutineExerciseTableViewController * exerciseCtrl = (UserRoutineExerciseTableViewController*)[segue destinationViewController];
    exerciseCtrl.currentRoutine = self.currentRoutine;
    exerciseCtrl.exerciseType = [sender integerValue];
    exerciseCtrl.exerciseTypeName = [exerciseList objectAtIndex:[sender integerValue]];
}


- (IBAction)closeBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
