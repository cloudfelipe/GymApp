//
//  RutineExcersiceTableViewController.h
//  GymApp
//
//  Created by Felipe Correa on 22/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Exercise;

@protocol RutineExcersiceTableViewControllerDelegate <NSObject>

-(void) RutineExcersiceTableViewControllerDidSelectedExercise:(Exercise*) newExercise;

@end

@interface RutineExcersiceTableViewController : UITableViewController

@property (nonatomic, weak) id <RutineExcersiceTableViewControllerDelegate> delegate;

@property (nonatomic) NSInteger selectedExcersiceIndex;
@property (nonatomic, strong) NSString* exerciseName;
@property (nonatomic) NSInteger exerciseType;
@property (nonatomic, strong) NSArray* excersicesList;

@property (nonatomic, strong) NSMutableArray* selectedExcersiceList;

@end
