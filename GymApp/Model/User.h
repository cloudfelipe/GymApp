//
//  User.h
//  GymApp
//
//  Created by Felipe Correa on 22/07/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CorporalSummary, Routine, Therapist, Trainer;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSDate * birthday;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * eps;
@property (nonatomic, retain) NSNumber * idNumber;
@property (nonatomic, retain) NSString * lastsname;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * occupation;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * phone;
@property (nonatomic, retain) Therapist *assesor;
@property (nonatomic, retain) NSSet *corporalsummaries;
@property (nonatomic, retain) NSSet *routines;
@property (nonatomic, retain) Trainer *trainer;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addCorporalsummariesObject:(CorporalSummary *)value;
- (void)removeCorporalsummariesObject:(CorporalSummary *)value;
- (void)addCorporalsummaries:(NSSet *)values;
- (void)removeCorporalsummaries:(NSSet *)values;

- (void)addRoutinesObject:(Routine *)value;
- (void)removeRoutinesObject:(Routine *)value;
- (void)addRoutines:(NSSet *)values;
- (void)removeRoutines:(NSSet *)values;

@end
