//
//  MGDRover.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDRover : NSObject

#pragma properties

@property (nonatomic, copy)NSString *roverName;
@property (nonatomic, readonly)NSString *launchDate;
@property (nonatomic, readonly)NSString *landingDate;
@property (nonatomic, readonly)NSNumber *maxSol;
@property (nonatomic, readonly)NSString *maxDateOnEarth;
@property (nonatomic, readonly)NSNumber *numberOfPhotosTakenByRover;
@property (nonatomic, copy)NSString *solDescriptions;

typedef NS_ENUM(NSInteger, roverActiveStatus) {
    ACTIVE = 0,
    COMPLETE = 1
};

#pragma initializer

- (instancetype)initWithRoverName:(NSString *)roverName
                      launchDate:(NSString *)launchDate
                     landingDate:(NSString *)landingDate
                          maxSol:(NSNumber *)maxSol
                  maxDateOnEarth:(NSString *)maxDateOnEarth
      numberOfPhotosTakenByRover:(NSNumber *)numberOfPhotosTakenByRover
                 solDescriptions:(NSString *)solDescriptions;

#pragma convenience initializer from Dictionary

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end









































