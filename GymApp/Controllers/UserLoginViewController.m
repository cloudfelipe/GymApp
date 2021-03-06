//
//  UserLoginViewController.m
//  GymApp
//
//  Created by Felipe Correa on 23/07/15.
//  Copyright © 2015 Reyes Magos. All rights reserved.
//

#import "UserLoginViewController.h"

#import "ViewController.h"
#import "AppDelegate.h"
#import "User.h"

#import "UserRoutineTableViewController.h"

@interface UserLoginViewController (){
    
    User* myUser;
}

@end

@implementation UserLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    
    myUser = [[context executeFetchRequest:fetchRequest error:&error] firstObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UINavigationController* navCtrl = [segue destinationViewController];
    
    UserRoutineTableViewController* userCtrl = (UserRoutineTableViewController*)[navCtrl topViewController];
    
    userCtrl.currentRoutine = [[myUser.routines allObjects] firstObject];
}


- (IBAction)signinBtn:(id)sender{
    
    
    
}

- (IBAction)loginBtn:(id)sender{
    
}

- (IBAction)segmentedControl:(id)sender {
    
    ViewController* userCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"workerLoginCtrl"];
    [self presentViewController:userCtrl animated:YES completion:nil];
    
}
@end
