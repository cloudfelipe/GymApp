//
//  UserRoutineExerciseTableViewController.h
//  GymApp
//
//  Created by Felipe Correa on 23/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Routine;


@interface UserRoutineExerciseTableViewController : UITableViewController

@property (nonatomic, strong) Routine* currentRoutine;
@property (nonatomic) NSInteger exerciseType;
@property (nonatomic, strong) NSString* exerciseTypeName;

@end
