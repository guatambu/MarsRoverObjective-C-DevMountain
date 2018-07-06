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
@property (nonatomic, copy)NSString *launchDate;
@property (nonatomic, copy)NSString *landingDate;
@property (nonatomic, copy)NSString *status;
@property (nonatomic, readonly)NSNumber *maxSol;
@property (nonatomic, copy)NSString *maxDateOnEarth;
@property (nonatomic, readonly)NSNumber *numberOfPhotosTakenByRover;
@property (nonatomic, copy)NSArray *photosBySol;

typedef NS_ENUM(NSInteger, roverActiveStatus) {
    ACTIVE = 0,
    COMPLETE = 1
};

#pragma initializer

- (instancetype)initWithRoverName:(NSString *)name
                       launchDate:(NSString *)launchDate
                      landingDate:(NSString *)landingDate
                           status:(NSString *)status
                           maxSol:(NSNumber *)maxSol
                   maxDateOnEarth:(NSString *)maxDateOnEarth
       numberOfPhotosTakenByRover:(NSNumber *)numberOfPhotosTakenByRover
                      photosBySol:(NSArray *)photosBySol;

#pragma convenience initializer from Dictionary

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end









































