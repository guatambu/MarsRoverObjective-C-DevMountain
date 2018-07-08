//
//  MGDMartianSolController.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGDRover.h"

@interface MGDMartianSolController : NSObject

#pragma properties

@property (nonatomic, readwrite)NSMutableArray *sols;
@property (nonatomic, readwrite)MGDRover *roverObjectWithSols;

#pragma sharedInstance

+(instancetype)sharedInstance;

@end
