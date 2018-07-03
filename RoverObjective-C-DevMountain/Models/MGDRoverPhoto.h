//
//  MGDRoverPhoto.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDRoverPhoto : NSObject

#pragma properties

@property (nonatomic, readonly)NSNumber *photoIdentifier;
@property (nonatomic, readonly)NSNumber *solPhotoTaken;
@property (nonatomic, copy)NSString *cameraAbbreviatedName;
@property (nonatomic, copy)NSString *cameraFullName;
@property (nonatomic, readonly)NSString *earthDatePhotoTaken;
@property (nonatomic, copy)NSString *imageURL;

#pragma initializer

- (instancetype) initWithPhotoIdentifier:(NSNumber *)photoIdentifier
                          solPhotoTaken:(NSNumber *)solPhotoTaken
                             cameraName:(NSString *)cameraAbbreviatedName
                         cameraFullName:(NSString *)cameraFullName
                    earthDatePhotoTaken:(NSString *)earthDatePhotoTaken
                               imageURL:(NSString *)imageURL;

#pragma convenience init with Dictionary

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end











































