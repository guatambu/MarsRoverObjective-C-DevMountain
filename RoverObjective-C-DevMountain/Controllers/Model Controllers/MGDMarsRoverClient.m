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
static NSString *photosPath = @"photos";

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
// URL to fetch an array of all available rovers
//
// https://api.nasa.gov/mars-photos/api/v1/rovers?&api_key=QlklXCD3vdy9QJg3SPd5CnnzdmfT5D2988STfwf5
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

+(NSURL *)urlForPhotosFromRover:(NSString *)roverName martianSolQueryValue:(NSNumber *)martianSolQueryValue
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    baseURL = [NSURL fileURLWithPath:roversPath];
    baseURL = [NSURL fileURLWithPath:roverName];
    baseURL = [NSURL fileURLWithPath:photosPath];
    
    NSURLComponents *roverSolURLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSString *martianSolQueryValueAsString = [martianSolQueryValue stringValue];
    
    NSURLQueryItem *solQuery = [NSURLQueryItem queryItemWithName:martianSolQueryKey  value:martianSolQueryValueAsString];
    
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:apiQueryKey value:apiQueryValue];
    
    roverSolURLComponents.queryItems = [NSArray arrayWithObjects:solQuery, apiQuery, nil];
    
    NSURL *roverSolSearchURL = roverSolURLComponents.URL;
    
    return roverSolSearchURL;
}

- (void)fetchAllMarsRoversWithCompletion:(void (^)(NSArray<NSString *> *, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    baseURL = [NSURL fileURLWithPath:roversPath];
    
    NSURLComponents *roversFetchURLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:apiQueryKey value:apiQueryValue];
    
    roversFetchURLComponents.queryItems = [NSArray arrayWithObject:apiQuery];
    
    NSURL *roversFetchURL = roversFetchURLComponents.URL;
    
    [[NSURLSession sharedSession]dataTaskWithURL:roversFetchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"there was an error > RoverClient line 111: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"there was an error > RoverClient line 117: %@", error.localizedDescription);
            completion(nil, error);
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *rovers = jsonDictionary[roversPath];
        
        completion(rovers, nil);
        
    }].resume;

}

- (void)fetchMissionManifestForRoverNamed:(NSString *)roverNamed completion:(void (^)(MGDRover *, NSError *))completion
{
    
    NSURL *roverManifestSearchURL = [MGDMarsRoverClient urlForInfoForRover:roverNamed];
    
    [[NSURLSession sharedSession]dataTaskWithURL:roverManifestSearchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"there was an error > MGDMarsRoverClient line 104: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"there was no data > MGDMarsRoverClient line 110: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        MGDRover *newRover = [[MGDRover alloc]initWithDictionary:jsonDictionary];
        
        completion(newRover, nil);
        
    }].resume;
    
}

- (void)fetchPhotosFromRover:(MGDRover *)rover martianSol:(NSNumber *)martianSol completion:(void (^)(NSArray<UIImage *> *, NSError *))completion
{
    
    
}

- (void)fetchImageDataForPhoto:(MGDRoverPhoto *)photo completion:(void (^)(NSData *, NSError *))completion
{
    
    
}




@end










































