//
//  MGDRoverPhotoController.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDRoverPhotoController : NSObject

#pragma properties

@property (nonatomic, readwrite)NSMutableArray *photos;

#pragma sharedInstance

+(instancetype)sharedInstance;

@end
