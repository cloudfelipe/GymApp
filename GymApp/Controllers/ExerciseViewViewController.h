//
//  ExerciseViewViewController.h
//  GymApp
//
//  Created by Felipe Correa on 23/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseViewViewController : UIViewController

@property (nonatomic) NSInteger series;
@property (nonatomic) NSInteger reps;

@property (weak, nonatomic) IBOutlet UILabel *seriesLB;
@property (weak, nonatomic) IBOutlet UILabel *repsLB;

@property (nonatomic, strong) NSString* exerciseTypeName;



@end
