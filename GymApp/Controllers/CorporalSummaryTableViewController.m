//
//  CorporalSummaryTableViewController.m
//  GymApp
//
//  Created by Felipe Correa on 17/06/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "CorporalSummaryTableViewController.h"

#import <ActionSheetDistancePicker.h>
#import <ActionSheetStringPicker.h>

@interface CorporalSummaryTableViewController (){
//    NSInteger selectedValue2;
//    NSInteger selectedValue;
    
    NSArray* trainersArray;
    
    float arm, thigh, thorax, waist, weight, carfialFrecuence;
}

@end

@implementation CorporalSummaryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arm = 0.0;
    thigh = 0.0;
    thorax = 0.0;
    waist = 0.0;
    weight = 0.0;
    carfialFrecuence = 0.0;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    trainersArray = @[@"Pedro", @"Juan", @"Felipe"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [[self.certaintyCells allObjects] count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [[self.certaintyCells allObjects] objectAtIndex:indexPath.row];
//}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                
                self.armTCell.detailTextLabel.text = @"Test";
                
//                [ActionSheetDistancePicker showPickerWithTitle:@"Seleccione medida" bigUnitString:@"cm" bigUnitMax:99 selectedBigUnit:selectedValue smallUnitString:@"mm" smallUnitMax:99 selectedSmallUnit:selectedValue2 target:self action:nil origin:tableView];
            }
                break;
                
            default:
//                [ActionSheetDistancePicker showPickerWithTitle:@"Seleccione medida" bigUnitString:@"cm" bigUnitMax:99 selectedBigUnit:selectedValue smallUnitString:@"mm" smallUnitMax:99 selectedSmallUnit:selectedValue2 target:self action:nil origin:tableView];
                break;
        }
        
    }else if (indexPath.section == 1){
        
//        [ActionSheetStringPicker showPickerWithTitle:<#(NSString *)#> rows:<#(NSArray *)#> initialSelection:<#(NSInteger)#> target:<#(id)#> successAction:<#(SEL)#> cancelAction:<#(SEL)#> origin:<#(id)#>]
        
        [ActionSheetStringPicker showPickerWithTitle:@"Seleccione instructor"
                                                rows:trainersArray
                                    initialSelection:0
                                           doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                               
                                               self.trainerTCell.detailTextLabel.text = (NSString*)selectedValue;

                                           }
                                         cancelBlock:^(ActionSheetStringPicker *picker) {
                                             
                                             self.trainerTCell.selected = NO;
                                         }
                                              origin:tableView];
        
    }
}

-(void) refreshTableViewData{
    
    self.armTCell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)arm];
    self.thighTCell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)thigh];
    self.thoraxTCell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)thorax];
    self.waistTCell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)waist];
    self.weightTCell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)weight];
    self.cardialFrecTCell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)carfialFrecuence];
    
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
