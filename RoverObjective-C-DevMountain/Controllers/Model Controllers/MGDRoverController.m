//
//  MGDRoverController.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDRoverController.h"

@implementation MGDRoverController

#pragma sharedInstance

+(instancetype)sharedInstance
{
    static MGDRoverController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MGDRoverController new];
    });
    return sharedInstance;
    
}

@end
