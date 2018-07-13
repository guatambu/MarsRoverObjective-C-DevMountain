//
//  MGDRover.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDRover.h"

@implementation MGDRover

- (instancetype)initWithRoverName:(NSString *)name
                       launchDate:(NSString *)launchDate
                      landingDate:(NSString *)landingDate
                          status:(NSString *)status
                           maxSol:(NSNumber *)maxSol
                   maxDateOnEarth:(NSString *)maxDateOnEarth
       numberOfPhotosTakenByRover:(NSNumber *)numberOfPhotosTakenByRover
                      photosBySol:(NSArray *)photosBySol

{
    self = [super init];
    if (self) {
        _roverName = name;
        _launchDate = launchDate;
        _landingDate = landingDate;
        _status = status;
        _maxSol = maxSol;
        _maxDateOnEarth = maxDateOnEarth;
        _numberOfPhotosTakenByRover = numberOfPhotosTakenByRover;
        _photosBySol = photosBySol;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[[MGDRover roverNameKey]];
    NSString *launchDate = dictionary[[MGDRover launchDateKey]];
    NSString *landingDate = dictionary[[MGDRover landingDateKey]];
    NSString *status = dictionary[[MGDRover statusKey]];
    NSNumber *maxSol = dictionary[[MGDRover maxSolKey]];
    NSString *maxDateOnEarth = dictionary[[MGDRover maxDateOnEarthKey]];
    NSNumber *numberOfPhotosTakenByRover = dictionary[[MGDRover numberOfPhotosTakenByRoverKey]];
    NSArray *photosBySol = dictionary[[MGDRover photosBySolKey]];
    
    
    return [self initWithRoverName:name
                        launchDate:launchDate
                       landingDate:landingDate
                            status:status
                            maxSol:maxSol
                    maxDateOnEarth:maxDateOnEarth
        numberOfPhotosTakenByRover:numberOfPhotosTakenByRover
                       photosBySol:photosBySol];
    
}

+ (NSString *)roverNameKey
{
    return @"name";
}

+ (NSString *)launchDateKey
{
    return @"launch_date";
}

+ (NSString *)landingDateKey
{
    return @"landing_date";
}

+ (NSString *)statusKey
{
    return @"status";
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
            
+ (NSString *)photosBySolKey
{
    return @"photos";
}


@end










































