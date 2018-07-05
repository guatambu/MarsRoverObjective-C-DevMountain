//
//  MGDMartianSolController.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDMartianSolController.h"

@implementation MGDMartianSolController

+(instancetype)sharedInstance
{
    static MGDMartianSolController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MGDMartianSolController new];
    });
    return sharedInstance;
}

@end
