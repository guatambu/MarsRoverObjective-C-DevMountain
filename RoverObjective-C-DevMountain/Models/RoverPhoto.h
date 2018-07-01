//
//  RoverPhoto.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoverPhoto : NSObject

@property (nonatomic, readonly)NSNumber *photoIdentifier;
@property (nonatomic, readonly)NSNumber *solPhotoTaken;
@property (nonatomic, copy)NSString *cameraName;
@property (nonatomic, readonly)NSDate *earthDatePhotoTaken;
@property (nonatomic, copy)NSString *imageURL;

+(instancetype) initWithPhotoIdentifier:(NSNumber *)photoIdentifier
                          solPhotoTaken:(NSNumber *)solPhotoTaken
                             cameraName:(NSString *)cameraName
                    earthDatePhotoTaken:(NSDate *)earthDatePhotoTaken
                               imageURL:(NSString *)imageURL;

@end











































