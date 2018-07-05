//
//  MGDRoverController.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDRoverController : NSObject

#pragma properties

@property (nonatomic, readwrite)NSMutableArray *rovers;

#pragma sharedInstance

+(instancetype)sharedInstance;

@end
