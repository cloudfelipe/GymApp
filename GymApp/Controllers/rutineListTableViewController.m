//
//  rutineListTableViewController.m
//  GymApp
//
//  Created by Felipe Correa on 16/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "rutineListTableViewController.h"

#import "SeriesAndLoopsViewController.h"
#import "MZFormSheetPresentationController.h"

@interface rutineListTableViewController ()<SeriesAndLoopsViewControllerDelegate>{
    NSArray* excersiceList;
}

@end

@implementation rutineListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Asignar Rutina";
    
    excersiceList = @[@"PECHO",@"ESPALDA",@"HOMBROS",@"BICEPS",@"TRICEPS",@"MUSLO",@"CADERA",@"PIERNA",@"ABDOMEN - CINTURA", @"ENTRENAMIENTO VASCULAR"];
    
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
    return [excersiceList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"excersiceCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [excersiceList objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SeriesAndLoopsViewController* seriesCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"seriesAndRepsModal"];
    seriesCtrl.delegate = self;
    
    MZFormSheetPresentationController *formSheetController = [[MZFormSheetPresentationController alloc] initWithContentViewController:seriesCtrl];
    formSheetController.contentViewSize = CGSizeMake(340, 158);
    formSheetController.shouldCenterVertically = YES;
    formSheetController.shouldApplyBackgroundBlurEffect = YES;
    formSheetController.contentViewControllerTransitionStyle = MZFormSheetPresentationTransitionStyleBounce;
    
    
    [self presentViewController:formSheetController animated:YES completion:nil];
    
}

-(void)SeriesAndLoopsViewControllerDidSelectedSeries:(NSInteger)noSeries withReps:(NSInteger)noReps{
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
