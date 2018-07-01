//
//  Rover.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rover : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, readonly)NSDate *launchDate;
@property (nonatomic, readonly)NSDate *landingDate;
@property (nonatomic, readonly)NSNumber *maxSol;
@property (nonatomic, readonly)NSDate *maxDateOnEarth;
@property (nonatomic, readonly)NSNumber *numberOfPhotosTakenByRover;
@property (nonatomic, readonly)NSArray *solDescriptions;

typedef NS_ENUM(NSInteger, roverActiveStatus) {
    ACTIVE = 0,
    INACTIVE = 1
};


+(instancetype)initWithRoverName:(NSString *)roverName
                      launchDate:(NSDate *)launchDate
                     landingDate:(NSDate *)landingDate
                          maxSol:(NSNumber *)maxSol
                  maxDateOnEarth:(NSDate *)maxDateOnEarth
      numberOfPhotosTakenByRover:(NSNumber *)numberOfPhotosTakenByRover
                 solDescriptions:(NSArray *)solDescriptions;


@end









































