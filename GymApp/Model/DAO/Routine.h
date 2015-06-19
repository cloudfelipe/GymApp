//
//  Routine.h
//  GymApp
//
//  Created by Felipe Correa on 18/06/15.
//  Copyright (c) 2015 Reyes Magos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Routine : NSManagedObject

@property (nonatomic, retain) User *owner;
@property (nonatomic, retain) NSManagedObject *performed;

@end
