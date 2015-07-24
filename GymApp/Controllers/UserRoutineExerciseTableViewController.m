//
//  UserRoutineExerciseTableViewController.m
//  GymApp
//
//  Created by Felipe Correa on 23/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "UserRoutineExerciseTableViewController.h"
#import "Exercise.h"
#import "Routine.h"

#import "ExerciseViewViewController.h"

@interface UserRoutineExerciseTableViewController (){
    NSMutableArray* exercisesList;
}

@end

@implementation UserRoutineExerciseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _exerciseTypeName;
    
    exercisesList = [[NSMutableArray alloc] init];
    
    NSArray* exAux = [self.currentRoutine.exercises allObjects];
    
    for (Exercise* ex in exAux) {
        if ([ex.exerciseType integerValue] == _exerciseType) {
            [exercisesList addObject:ex];
        }
    }
    
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
    return [exercisesList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"excerciseCell" forIndexPath:indexPath];
    
    UILabel* exerciseLB = (UILabel*)[cell.contentView viewWithTag:1];
    UILabel* seriesLB = (UILabel*)[cell.contentView viewWithTag:2];
    
    Exercise* exx = [exercisesList objectAtIndex:indexPath.row];
    
    exerciseLB.text = exx.exerciseName;
    seriesLB.text = [NSString stringWithFormat:@"Series: %ld - Repeticiones: %ld", (long)[exx.series integerValue], (long)[exx.reps integerValue]];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"exerciseDetail" sender:[NSNumber numberWithInteger:indexPath.row]];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    Exercise* exx = [exercisesList objectAtIndex:[sender integerValue]];
    
    ExerciseViewViewController* exCtrl = (ExerciseViewViewController*)[segue destinationViewController];
    exCtrl.series = [exx.series integerValue];
    exCtrl.reps = [exx.reps integerValue];
    exCtrl.exerciseTypeName = exx.exerciseName;
}


@end
