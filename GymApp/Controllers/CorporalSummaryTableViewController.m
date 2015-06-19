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

#import "AppDelegate.h"
#import "CorporalSummary.h"

@interface CorporalSummaryTableViewController (){
    NSInteger selectedValue2;
    NSInteger selectedValue;
    
    NSInteger selectedCellIndex;
    
    NSArray* trainersArray;
    
    float arm, thigh, thorax, waist, weight, carfialFrecuence;
    
    NSArray* weightsArray, *cardialFrecsArray;
}

- (void)measurementWasSelectedWithBigUnit:(NSNumber *)bigUnit smallUnit:(NSNumber *)smallUnit element:(id)element;

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
    
    //Creates the array
    
    NSMutableArray* arrayAux = [[NSMutableArray alloc]init];
    for (int i = 39; i < 150; i++) {
        [arrayAux addObject:[NSString stringWithFormat:@"%d", i+1]];
    }
    
    weightsArray = [arrayAux copy];
    cardialFrecsArray = [arrayAux copy];
    
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
                [ActionSheetDistancePicker showPickerWithTitle:@"Seleccione medida" bigUnitString:@"cm" bigUnitMax:99 selectedBigUnit:selectedValue smallUnitString:@"mm" smallUnitMax:99 selectedSmallUnit:selectedValue2 target:self action:@selector(measurementWasSelectedWithBigUnit:smallUnit:element:) origin:self.armTCell];
                
                selectedCellIndex = 0;
                
            }
                break;
            case 1:
            {
                [ActionSheetDistancePicker showPickerWithTitle:@"Seleccione medida" bigUnitString:@"cm" bigUnitMax:99 selectedBigUnit:selectedValue smallUnitString:@"mm" smallUnitMax:99 selectedSmallUnit:selectedValue2 target:self action:@selector(measurementWasSelectedWithBigUnit:smallUnit:element:) origin:self.thighTCell];
                selectedCellIndex = 1;
            }
                break;
            case 2:
            {
                [ActionSheetDistancePicker showPickerWithTitle:@"Seleccione medida" bigUnitString:@"cm" bigUnitMax:99 selectedBigUnit:selectedValue smallUnitString:@"mm" smallUnitMax:99 selectedSmallUnit:selectedValue2 target:self action:@selector(measurementWasSelectedWithBigUnit:smallUnit:element:) origin:self.thoraxTCell];
                selectedCellIndex = 2;
            }
                break;
            case 3:
            {
                [ActionSheetDistancePicker showPickerWithTitle:@"Seleccione medida" bigUnitString:@"cm" bigUnitMax:99 selectedBigUnit:selectedValue smallUnitString:@"mm" smallUnitMax:99 selectedSmallUnit:selectedValue2 target:self action:@selector(measurementWasSelectedWithBigUnit:smallUnit:element:) origin:self.waistTCell];
                selectedCellIndex = 3;
            }
                break;
            case 4:
            {
                selectedCellIndex = 4;
                
                [ActionSheetStringPicker showPickerWithTitle:@"Seleccione peso (Kg)"
                                                        rows:weightsArray
                                            initialSelection:0
                                                   doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValuee) {
                                                       
                                                       self.weightTCell.detailTextLabel.text = [NSString stringWithFormat:@"%@ Kg", selectedValuee];
                                                       
                                                       weight = [selectedValuee floatValue];
                                                       
                                                   }
                                                 cancelBlock:^(ActionSheetStringPicker *picker) {
                                                     
                                                     self.weightTCell.selected = NO;
                                                 }
                                                      origin:self.weightTCell];
            }
                break;
            case 5:
            {
                
                [ActionSheetStringPicker showPickerWithTitle:@"Seleccione Frec Card (PPM)"
                                                        rows:cardialFrecsArray
                                            initialSelection:0
                                                   doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValuee) {
                                                       
                                                       self.cardialFrecTCell.detailTextLabel.text = [NSString stringWithFormat:@"%@ PPM", selectedValuee];
                                                       
                                                       carfialFrecuence = [selectedValuee floatValue];
                                                       
                                                   }
                                                 cancelBlock:^(ActionSheetStringPicker *picker) {
                                                     
                                                     self.cardialFrecTCell.selected = NO;
                                                 }
                                                      origin:self.cardialFrecTCell];
                
                
                selectedCellIndex = 5;
            }
                break;
                
            default:
                break;
        }
        
    }else if (indexPath.section == 1){
        
        [ActionSheetStringPicker showPickerWithTitle:@"Seleccione instructor"
                                                rows:trainersArray
                                    initialSelection:0
                                           doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValuee) {
                                               
                                               self.trainerTCell.detailTextLabel.text = (NSString*)selectedValuee;

                                           }
                                         cancelBlock:^(ActionSheetStringPicker *picker) {
                                             
                                             self.trainerTCell.selected = NO;
                                         }
                                              origin:tableView];
        
    }
}

- (void)measurementWasSelectedWithBigUnit:(NSNumber *)bigUnit smallUnit:(NSNumber *)smallUnit element:(id)element {
    
    NSString* numberConcatStr = [NSString stringWithFormat:@"%ld.%ld", (long)[bigUnit intValue], (long)[smallUnit intValue]];
    float numberConcat = [numberConcatStr floatValue];
    
    [[(UITableViewCell*)element detailTextLabel] setText:[NSString stringWithFormat:@"%@ cm", numberConcatStr]];
    
    switch (selectedCellIndex) {
        case 0:
            arm = numberConcat;
            break;
        case 1:
            thigh = numberConcat;
            break;
        case 2:
            thorax = numberConcat;
            break;
        case 3:
            waist = numberConcat;
            break;
        case 4:
            weight = numberConcat;
            break;
        case 5:
            carfialFrecuence = numberConcat;
            break;
            
        default:
            break;
    }
    
    
    //self.selectedSmallUnit = [smallUnit intValue];
    //[element setText:[NSString stringWithFormat:@"%i m and %i cm", [bigUnit intValue], [smallUnit intValue]]];
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

- (IBAction)saveBtn:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    CorporalSummary* aCorporalSummary = [NSEntityDescription insertNewObjectForEntityForName:@"CorporalSummary" inManagedObjectContext:context];
    
    aCorporalSummary.arm = [NSNumber numberWithFloat:arm];
//    aCorporalSummary.thigh = [NSDecimalNumber num];
    aCorporalSummary.thorax = [NSNumber numberWithFloat:thorax];
//    aCorporalSummary.waist = [NSNumber numberWithFloat:arm];
    aCorporalSummary.weight = [NSNumber numberWithFloat:weight];
    aCorporalSummary.additionalNote = @"";
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *now = [[NSDate alloc] init];
    aCorporalSummary.date = now;
    NSString *theDate = [dateFormat stringFromDate:now];
    NSLog(@"HOy: %@", theDate);
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Nooo, error al grabar: %@", [error localizedDescription]);
    }else{
        // do whatever you want with the results - you can access specific values from the dictionary using
        // the key you provided when you created the form
        NSLog(@"%@", [aCorporalSummary weight]);
        
        [self.delegate CorporalSummaryTableViewControllerDidSave:self didNewCorporalSummary:aCorporalSummary];
        
        // now that we're done, dismiss the form
        [self dismissViewControllerAnimated:YES completion:nil];
    }
   
}

- (IBAction)cancelBtn:(id)sender {
    
    // now that we're done, dismiss the form
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
