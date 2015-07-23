//
//  Exercise.h
//  GymApp
//
//  Created by Felipe Correa on 22/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Routine;

@interface Exercise : NSManagedObject

@property (nonatomic, retain) NSString * exerciseName;
@property (nonatomic, retain) NSNumber * series;
@property (nonatomic, retain) NSNumber * reps;
@property (nonatomic, retain) NSNumber * exerciseType;
@property (nonatomic, retain) Routine *owner;

@end
