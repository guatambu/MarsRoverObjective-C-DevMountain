//
//  MGDMartianSol.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDMartianSol.h"

@implementation MGDMartianSol

-(instancetype)initWithMartianSol:(NSNumber *)martianSol
     numberOfPhotosTakenDuringSol:(NSNumber *)numberOfPhotosTakenDuringSol
                          cameras:(NSArray *)cameras
{
    self = [super init];
    if (self) {
        _martianSol = martianSol;
        _numberOfPhotosTakenDuringSol = numberOfPhotosTakenDuringSol;
        _cameras = cameras;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSNumber *martianSol = dictionary[[MGDMartianSol martianSolKey]];
    NSNumber *numberOfPhotosTakenDuringSol = dictionary[[MGDMartianSol numberOfPhotosTakenDuringSolKey]];
    NSArray *cameras = dictionary[[MGDMartianSol camerasKey]];
    
    return [self initWithMartianSol:martianSol
       numberOfPhotosTakenDuringSol:numberOfPhotosTakenDuringSol
                            cameras:cameras];
}

+(NSString *)martianSolKey
{
    return @"sol";
}

+(NSString *)numberOfPhotosTakenDuringSolKey
{
    return @"total_photos";
}

+(NSString *)camerasKey
{
    return @"cameras";
}


@end
