//
//  rutineListTableViewController.m
//  GymApp
//
//  Created by Felipe Correa on 16/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "rutineListTableViewController.h"

#import "RutineExcersiceTableViewController.h"
#import "Routine.h"

#import "AppDelegate.h"

#import "User.h"

@interface rutineListTableViewController ()<RutineExcersiceTableViewControllerDelegate>{
    NSArray* excersiceList;
    NSArray* excersicesList;
    
    Routine* currentRoutine;
    
    AppDelegate* appDelegate;
}

@end

@implementation rutineListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Asignar Rutina";
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    currentRoutine = [NSEntityDescription insertNewObjectForEntityForName:@"Routine" inManagedObjectContext:context];
    
    currentRoutine.date = [[NSDate alloc] init];
    currentRoutine.owner = self.currentUser;
    
    excersiceList = @[@"PECHO",@"ESPALDA",@"HOMBROS",@"BICEPS",@"TRICEPS",@"MUSLO",@"CADERA",@"PIERNA",@"ABDOMEN - CINTURA"];
    
    excersicesList = @[@[@"PRESS INCLINADO BARRA",@"PRESS PLANO CON MANCUERNA",@"PRESIÓN PECHO PLANO EXTREMO",@"PRESIÓN PECHO SENTADO",@"APERTURA MAQUINA SENTADO"],@[@"JALÓN POLEA ADELANTE ABIERTO",@"JALÓN POLEA ADELANTE CERRADO",@"REMO DE POLEA",@"JALÓN ADELTANTE EXTREMO",@"REMO PALANCA BAJA EXTREMO", @"REMO MÁQUINA"],@[@"ELEVACIÓN LATERAL MÁQUINA",@"PRESS MILITAR CON MANCUERNA",@"ELEVACIÓN FRONTAL MANCUERAN",@"ELEVACIÓN POLEA FRONTAL",@"PRESS MILITAR EXTREMO"],@[@"FLEXIÓN EXTENSIÓN CODO POLEA",@"PREDICADOR MÁQUINA",@"FLEXIÓN EXTENSIÓN CODO BARRA",@"CURT CONCENTRACIÓN MANCUERNA",@"FLEXIÓN EXTENSION CODO"],@[@"EXTENSIÓN POLEA",@"EXTENSIÓN POLEA INDIVIDUAL",@"EXTENSIÓN CODO PARALELAS",@"COPA MANCUERNA",@"FONDOS"],@[@"EXTENSIÓN RODILLA",@"FLEXIÓN RODILLA SENTADO",@"PRENSA ATLÉTICA",@"ADUCTORES MÁQUINA SENTADO",@"ABDUCTOR MÁQUINA SENTADO"],@[@"SENTADILLA POWER INVERTIDA",@"RODILLO SUPERIOR",@"DE PIE ELEVADO CABLE ATRÁS",@"CUADRUPEDIA ELEVACIÓN"],@[@"PANTORRILLA SENTADO",@"PANTORRILLA INCLINADO",@"PANTORRILLA EN PRENSA",@"PANTORRILLA CON MANCUERNA"],@[@"CRUNCH",@"BANCA COMPLETA",@"LATERAL EN BANCO",@"ELEVACIÓN DE PIES",@"CRUNCH MÁQUINA PESO"]];
    
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
    
    [self performSegueWithIdentifier:@"excersiceCtrl" sender:[NSNumber numberWithInteger:indexPath.row]];
    
}

-(void)RutineExcersiceTableViewControllerDidSelectedExercise:(Exercise *)newExercise{
    [currentRoutine addExercisesObject:newExercise];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    RutineExcersiceTableViewController* exerciseCtrl = (RutineExcersiceTableViewController*)[segue destinationViewController];
    exerciseCtrl.delegate = self;
    exerciseCtrl.excersicesList = [excersicesList objectAtIndex:[sender integerValue]];
    exerciseCtrl.exerciseName = [excersiceList objectAtIndex:[sender integerValue]];
    exerciseCtrl.exerciseType = [sender integerValue];
    
    exerciseCtrl.selectedExcersiceList = [[currentRoutine.exercises allObjects] mutableCopy];
    
}


- (IBAction)saveRoutine:(id)sender {
    
    
    
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Nooo, error al grabar: %@", [error localizedDescription]);
    }else{
        // do whatever you want with the results - you can access specific values from the dictionary using
        // the key you provided when you created the form
        
//        [self.delegate CorporalSummaryTableViewControllerDidSave:self didNewCorporalSummary:aCorporalSummary];
        
        // now that we're done, dismiss the form
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
}

- (IBAction)closeBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
