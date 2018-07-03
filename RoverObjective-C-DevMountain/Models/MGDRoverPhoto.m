//
//  MGDRoverPhoto.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDRoverPhoto.h"

@implementation MGDRoverPhoto

-(instancetype)initWithPhotoIdentifier:(NSNumber *)photoIdentifier
                         solPhotoTaken:(NSNumber *)solPhotoTaken
                            cameraName:(NSString *)cameraAbbreviatedName
                        cameraFullName:(NSString *)cameraFullName
                   earthDatePhotoTaken:(NSString *)earthDatePhotoTaken
                              imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self) {
        _photoIdentifier = photoIdentifier;
        _solPhotoTaken = solPhotoTaken;
        _cameraAbbreviatedName = cameraAbbreviatedName;
        _cameraFullName = cameraFullName;
        _earthDatePhotoTaken = earthDatePhotoTaken;
        _imageURL = imageURL;
        
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSNumber *photoIdentifier = dictionary[[MGDRoverPhoto photoIdentifierKey]];
    NSNumber *solPhotoTaken = dictionary[[MGDRoverPhoto solPhotoTakenKey]];
    NSString *cameraAbbreviatedName = dictionary[[MGDRoverPhoto cameraAbbreviatedNameKey]];
    NSString *cameraFullName = dictionary[[MGDRoverPhoto cameraFullNameKey]];
    NSString *earthDatePhotoTaken = dictionary[[MGDRoverPhoto earthDatePhotoTakenKey]];
    NSString *imageURL = dictionary[[MGDRoverPhoto imageURLKey]];
    
    return [self initWithPhotoIdentifier:photoIdentifier
                           solPhotoTaken:solPhotoTaken
                              cameraName:cameraAbbreviatedName
                          cameraFullName:cameraFullName
                     earthDatePhotoTaken:earthDatePhotoTaken
                                imageURL:imageURL];
}

+ (NSString *)photoIdentifierKey
{
    return @"id";
}

+ (NSString *)solPhotoTakenKey
{
    return @"sol";
}

+ (NSString *)cameraAbbreviatedNameKey
{
    return @"name";
}

+ (NSString *)cameraFullNameKey
{
    return @"full_name";
}

+ (NSString *)earthDatePhotoTakenKey
{
    return @"earth_date";
}

+ (NSString *)imageURLKey
{
    return @"img_src";
}


@end







































