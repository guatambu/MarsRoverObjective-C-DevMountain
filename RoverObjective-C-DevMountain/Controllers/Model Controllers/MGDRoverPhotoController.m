//
//  MGDRoverPhotoController.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDRoverPhotoController.h"

@implementation MGDRoverPhotoController

+(instancetype)sharedInstance
{
    static MGDRoverPhotoController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MGDRoverPhotoController new];
    });
    return sharedInstance;
}

@end
