//
//  MGDRover.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDRover.h"

@implementation MGDRover

- (instancetype)initWithRoverName:(NSString *)roverName
                       launchDate:(NSString *)launchDate
                      landingDate:(NSString *)landingDate
                           maxSol:(NSNumber *)maxSol
                   maxDateOnEarth:(NSString *)maxDateOnEarth
       numberOfPhotosTakenByRover:(NSNumber *)numberOfPhotosTakenByRover
                  solDescriptions:(NSString *)solDescriptions
{
    self = [super init];
    if (self) {
        _roverName = roverName;
        _launchDate = launchDate;
        _landingDate = landingDate;
        _maxSol = maxSol;
        _maxDateOnEarth = maxDateOnEarth;
        _numberOfPhotosTakenByRover = numberOfPhotosTakenByRover;
        _solDescriptions = solDescriptions;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *roverName = dictionary[[MGDRover roverNameKey]];
    NSString *launchDate = dictionary[[MGDRover launchDateKey]];
    NSString *landingDate = dictionary[[MGDRover landingDateKey]];
    NSNumber *maxSol = dictionary[[MGDRover maxSolKey]];
    NSString *maxDateOnEarth = dictionary[[MGDRover maxDateOnEarthKey]];
    NSNumber *numberOfPhotosTakenByRover = dictionary[[MGDRover numberOfPhotosTakenByRoverKey]];
    
    
    return [self initWithRoverName:roverName
                        launchDate:launchDate
                       landingDate:landingDate maxSol:maxSol
                    maxDateOnEarth:maxDateOnEarth
        numberOfPhotosTakenByRover:numberOfPhotosTakenByRover
                   solDescriptions:@"Sol Description"];
    
}

+ (NSString *)roverNameKey
{
    return @"rover";
}

+ (NSString *)launchDateKey
{
    return @"launch_date";
}

+ (NSString *)landingDateKey
{
    return @"landing_date";
}

+ (NSString *)maxSolKey
{
    return @"max_sol";
}

+ (NSString *)maxDateOnEarthKey
{
    return @"max_date";
}

+ (NSString *)numberOfPhotosTakenByRoverKey
{
    return @"total_photos";
}


@end










































