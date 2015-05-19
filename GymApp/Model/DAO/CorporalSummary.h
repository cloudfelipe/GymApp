//
//  CorporalSummary.h
//  GymApp
//
//  Created by Felipe Correa on 18/05/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface CorporalSummary : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * height;
@property (nonatomic, retain) NSNumber * thorax;
@property (nonatomic, retain) NSDecimalNumber * waist;
@property (nonatomic, retain) NSDecimalNumber * thigh;
@property (nonatomic, retain) NSNumber * arm;
@property (nonatomic, retain) NSString * additionalNote;
@property (nonatomic, retain) User *owner;

@end
