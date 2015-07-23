//
//  Therapist.h
//  GymApp
//
//  Created by Felipe Correa on 22/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CorporalSummary, User;

@interface Therapist : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSSet *asses;
@property (nonatomic, retain) NSSet *perform;
@end

@interface Therapist (CoreDataGeneratedAccessors)

- (void)addAssesObject:(User *)value;
- (void)removeAssesObject:(User *)value;
- (void)addAsses:(NSSet *)values;
- (void)removeAsses:(NSSet *)values;

- (void)addPerformObject:(CorporalSummary *)value;
- (void)removePerformObject:(CorporalSummary *)value;
- (void)addPerform:(NSSet *)values;
- (void)removePerform:(NSSet *)values;

@end
