//
//  SeriesAndLoopsViewController.m
//  GymApp
//
//  Created by Felipe Correa on 21/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import "SeriesAndLoopsViewController.h"

@interface SeriesAndLoopsViewController (){
    
    __weak IBOutlet UILabel *seriesLB;
    __weak IBOutlet UIStepper *seriesSTP;
    
    __weak IBOutlet UILabel *repsLB;
    __weak IBOutlet UIStepper *respSTP;
}

@end

@implementation SeriesAndLoopsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSInteger value = seriesSTP.value;
    seriesLB.text = [NSString stringWithFormat:@"No. Series: %ld", (long)value];
    
    value = respSTP.value;
    repsLB.text = [NSString stringWithFormat:@"No. Repet: %ld", (long)value];
    
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

- (IBAction)repsSTP:(UIStepper *)sender {
    NSUInteger value = sender.value;
    repsLB.text = [NSString stringWithFormat:@"No. Repet: %ld", (long)value];
}

- (IBAction)cancelBtn:(id)sender {
}

- (IBAction)doneBtn:(id)sender {
    
    [self.delegate SeriesAndLoopsViewControllerDidSelectedSeries:seriesSTP.value withReps:respSTP.value];
}

- (IBAction)seriesSTP:(UIStepper *)sender {
    NSUInteger value = sender.value;
    seriesLB.text = [NSString stringWithFormat:@"No. Series: %ld", (long)value];
}
@end
