//
//  Trainer.h
//  GymApp
//
//  Created by Felipe Correa on 22/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Routine, User;

@interface Trainer : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * latname;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSSet *make;
@property (nonatomic, retain) NSSet *trains;
@end

@interface Trainer (CoreDataGeneratedAccessors)

- (void)addMakeObject:(Routine *)value;
- (void)removeMakeObject:(Routine *)value;
- (void)addMake:(NSSet *)values;
- (void)removeMake:(NSSet *)values;

- (void)addTrainsObject:(User *)value;
- (void)removeTrainsObject:(User *)value;
- (void)addTrains:(NSSet *)values;
- (void)removeTrains:(NSSet *)values;

@end
