//
//  User.h
//  GymApp
//
//  Created by Felipe Correa on 18/05/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CorporalSummary;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * lastsname;
@property (nonatomic, retain) NSNumber * phone;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * occupation;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * idNumber;
@property (nonatomic, retain) NSString * eps;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSDate * birthday;
@property (nonatomic, retain) NSSet *corporalsummaries;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addCorporalsummariesObject:(CorporalSummary *)value;
- (void)removeCorporalsummariesObject:(CorporalSummary *)value;
- (void)addCorporalsummaries:(NSSet *)values;
- (void)removeCorporalsummaries:(NSSet *)values;

@end
