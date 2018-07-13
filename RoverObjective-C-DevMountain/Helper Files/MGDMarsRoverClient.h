//
//  MGDMarsRoverClient.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/3/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGDRover.h"
#import "MGDRoverPhoto.h"

@interface MGDMarsRoverClient : NSObject

#pragma GET networking methods

+ (void) fetchAllMarsRoversWithCompletion:(void(^)(NSArray *roverStrings, NSError *error))completion;

+ (void) fetchMissionManifestForRoverNamed:(NSString *)roverNamed completion:(void(^)(MGDRover *roverObject, NSError *error))completion;

+ (void) fetchPhotosFromRover:(MGDRover *)rover martianSol:(NSNumber *)martianSol completion:(void(^)(NSArray<UIImage *> *roverPhotos, NSError *error))completion;

+ (void) fetchImageDataForPhoto:(MGDRoverPhoto *)photo completion:(void(^)(NSData *data, NSError *error))completion;

@end







































