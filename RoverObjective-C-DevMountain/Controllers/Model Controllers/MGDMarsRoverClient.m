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

static NSString *baseURLAsString = @"https://api.nasa.gov/mars-photos/api/v1/";
static NSString *apiQueryKey = @"api_key";
static NSString *apiQueryValue = @"QlklXCD3vdy9QJg3SPd5CnnzdmfT5D2988STfwf5";
static NSString *martianSolQueryKey = @"sol";
static NSString *roversPath = @"rovers";
static NSString *manifestsPath = @"manifests";

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
//
//
// NASA API KEY info:
//
// https://api.nasa.gov/planetary/apod?api_key=QlklXCD3vdy9QJg3SPd5CnnzdmfT5D2988STfwf5
// For additional support, please contact us. When contacting us, please tell us what API you're accessing and provide the following account details so we can quickly find you:
//
// Account Email: mggdavis@gmail.com
// Account ID: 1414fc71-8bd2-451b-bb6e-835e9f5ed3ac



+(NSURL *)urlForInfoForRover:(NSString *)roverName
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    baseURL = [NSURL fileURLWithPath:manifestsPath];
    baseURL = [NSURL fileURLWithPath:roverName];
    
    NSURLComponents *roverManifestURLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:apiQueryKey value:apiQueryValue];
    
    roverManifestURLComponents.queryItems = [NSArray arrayWithObject:apiQuery];
    
    NSURL *manifestRoverSearchURL = roverManifestURLComponents.URL;
    
    return manifestRoverSearchURL;
    
}

+(NSURL *)urlForPhotosFromRover:(NSString *)roverName martianSolQueryvalue:(NSNumber *)martianSolQueryValue
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    baseURL = [NSURL fileURLWithPath:roversPath];
    baseURL = [NSURL fileURLWithPath:roverName];
    
    NSURLComponents *roverSolURLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *solQuery = [NSURLQueryItem queryItemWithName:martianSolQueryKey  value:martianSolQueryValue];
    
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:apiQueryKey value:apiQueryValue];
    
    roverSolURLComponents.queryItems = [NSArray arrayWithObjects:solQuery, apiQuery, nil];
    
    NSURL *roverSolSearchURL = roverSolURLComponents.URL;
    
    return roverSolSearchURL;
}


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










































