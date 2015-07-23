//
//  RutineExcersiceTableViewController.m
//  GymApp
//
//  Created by Felipe Correa on 22/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "RutineExcersiceTableViewController.h"
#import "MZFormSheetPresentationController.h"
#import "SeriesAndLoopsViewController.h"

#import "Exercise.h"

#import "AppDelegate.h"


@interface RutineExcersiceTableViewController ()<SeriesAndLoopsViewControllerDelegate>{
//    NSArray* excersicesList;
    
//    Exercise* currentExercise;
}

@end

@implementation RutineExcersiceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _exerciseName;
    
//    self.selectedExcersiceList = [[NSMutableArray alloc] init];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.backgroundColor = [UIColor blackColor];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
//    selectedExcersiceList = [excersicesList objectAtIndex:_selectedExcersiceIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Exercise*) getExerciseByName:(NSString*) exerciseName{
    
    for (Exercise* anExercise in self.selectedExcersiceList) {
        if ([anExercise.exerciseName isEqualToString:exerciseName]) {
            return anExercise;
        }
    }
    
    return nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.excersicesList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"excerciseCell" forIndexPath:indexPath];
    
    UILabel* exerciseLB = (UILabel*)[cell.contentView viewWithTag:1];
    UILabel* seriesLB = (UILabel*)[cell.contentView viewWithTag:2];
    
    exerciseLB.text = [self.excersicesList objectAtIndex:indexPath.row];
    
    Exercise* exercisFounded = [self getExerciseByName:[self.excersicesList objectAtIndex:indexPath.row]];
    
    if (exercisFounded) {
        seriesLB.text = [NSString stringWithFormat:@"Series: %ld - Repeticiones: %ld", (long)[exercisFounded.series integerValue], (long)[exercisFounded.reps integerValue]];
    }else{
        seriesLB.text = @"Sin asignar";
    }
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - UITableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SeriesAndLoopsViewController* seriesCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"seriesAndRepsModal"];
    seriesCtrl.delegate = self;
    seriesCtrl.exerciseName = [self.excersicesList objectAtIndex:indexPath.row];
    
    MZFormSheetPresentationController *formSheetController = [[MZFormSheetPresentationController alloc] initWithContentViewController:seriesCtrl];
    formSheetController.contentViewSize = CGSizeMake(340, 158);
    formSheetController.shouldCenterVertically = YES;
    formSheetController.shouldApplyBackgroundBlurEffect = YES;
    formSheetController.contentViewControllerTransitionStyle = MZFormSheetPresentationTransitionStyleBounce;
    
    
    [self presentViewController:formSheetController animated:YES completion:nil];
    
}

-(void) SeriesAndLoopsViewControllerDidSelectedExercise: (NSString*) exerciseName withSeries:(NSInteger) noSeries withReps:(NSInteger) noReps{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    Exercise* exercise = [NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:context];
    
    exercise.exerciseType = [NSNumber numberWithInteger:self.exerciseType];
    exercise.exerciseName = exerciseName;
    exercise.series = [NSNumber numberWithInteger:noSeries];
    exercise.reps = [NSNumber numberWithInteger:noReps];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Nooo, error al grabar: %@", [error localizedDescription]);
    }else{
        
        [self.selectedExcersiceList addObject:exercise];
        
        [self.delegate RutineExcersiceTableViewControllerDidSelectedExercise:exercise];
        
        [self.tableView reloadData];
        
        // do whatever you want with the results - you can access specific values from the dictionary using
        // the key you provided when you created the form
        
//        [self.delegate CorporalSummaryTableViewControllerDidSave:self didNewCorporalSummary:aCorporalSummary];
        
        // now that we're done, dismiss the form
//        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    NSLog(@"Series: %ld, Rep: %ld", noSeries, noReps);
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

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
