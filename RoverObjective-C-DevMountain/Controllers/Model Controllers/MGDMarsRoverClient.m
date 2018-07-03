//
//  MGDMarsRoverClient.m
//  RoverObjective-C-DevMountain
//
//  Created by Kelly Johnson on 7/3/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGDMarsRoverClient.h"
#import "MGDRover.h"
#import "MGDRoverPhoto.h"

@implementation MGDMarsRoverClient

// examples of the kinds of URLs neede for the appropriate rover photos calls
//
// URLs for photos organized by rover name:
//
// https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY
//
// https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=1000&api_key=DEMO_KEY
//
// https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=1000&api_key=DEMO_KEY
//
// URL for rover photo manifest organized by sol:
//
// https://api.nasa.gov/mars-photos/api/v1/manifests/Curiosity/?&api_key=DEMO_KEY


- (void)fetchAllMarsRoversWithCompletion:(void (^)(NSArray<NSString *> *, NSError *))completion
{
    
    
}

- (void)fetchMissionManifestForRoverNamed:(NSString *)roverNamed completion:(void (^)(MGDRover *, NSError *))completion
{
    
    
}

- (void)fetchPhotosFromRover:(MGDRover *)rover martianSol:(NSNumber *)martianSol completion:(void (^)(NSArray<UIImage *> *, NSError *))completion
{
    
    
}

- (void)fetchImageDataForPhoto:(MGDRoverPhoto *)photo completion:(void (^)(NSData *, NSError *))completion
{
    
    
}

@end










































