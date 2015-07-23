//
//  Routine.h
//  GymApp
//
//  Created by Felipe Correa on 22/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exercise, Trainer, User;

@interface Routine : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) User *owner;
@property (nonatomic, retain) Trainer *performed;
@property (nonatomic, retain) NSSet *exercises;
@end

@interface Routine (CoreDataGeneratedAccessors)

- (void)addExercisesObject:(Exercise *)value;
- (void)removeExercisesObject:(Exercise *)value;
- (void)addExercises:(NSSet *)values;
- (void)removeExercises:(NSSet *)values;

@end
