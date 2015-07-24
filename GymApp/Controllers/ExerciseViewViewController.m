//
//  ExerciseViewViewController.m
//  GymApp
//
//  Created by Felipe Correa on 23/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "ExerciseViewViewController.h"

@interface ExerciseViewViewController ()

@end

@implementation ExerciseViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _seriesLB.text = [NSString stringWithFormat:@"Series: %ld", (long)_series];
    _repsLB.text = [NSString stringWithFormat:@"Repeticiones: %ld", (long)_reps];
    
    self.title = self.exerciseTypeName;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
