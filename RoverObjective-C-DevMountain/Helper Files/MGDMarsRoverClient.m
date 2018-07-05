//
//  MGDMarsRoverClient.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/3/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGDMarsRoverClient.h"
#import "MGDRover.h"
#import "MGDRoverPhoto.h"

static NSString *baseURLAsString = @"https://api.nasa.gov/";
static NSString *apiQueryKey = @"api_key";
static NSString *apiQueryValue = @"QlklXCD3vdy9QJg3SPd5CnnzdmfT5D2988STfwf5";
static NSString *martianSolQueryKey = @"sol";
static NSString *roversPath = @"/mars-photos/api/v1/rovers";
static NSString *manifestsPath = @"/mars-photos/api/v1/manifests";
static NSString *photosPath = @"/photos";

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

#pragma method to generate NSURL for list of photos organized by individual Mars Rover manifest

+(NSURL *)urlForInfoForRover:(NSString *)roverName
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    NSURLComponents *roverManifestURLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    roverManifestURLComponents.path = [NSString stringWithFormat: @"%@/%@", manifestsPath, roverName];
    
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:apiQueryKey value:apiQueryValue];
    
    roverManifestURLComponents.queryItems = [NSArray arrayWithObject:apiQuery];
    
    NSURL *manifestRoverSearchURL = roverManifestURLComponents.URL;
    
    return manifestRoverSearchURL;
    
}


#pragma method to generate NSURL for actual photos based on individual Mars Rover name and Martian Sol date

+(NSURL *)urlForPhotosFromRover:(NSString *)roverName martianSolQueryValue:(NSNumber *)martianSolQueryValue
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    NSURLComponents *roverSolURLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    roverSolURLComponents.path = [NSString stringWithFormat:@"%@/%@%@", roversPath, roverName, photosPath];
    
    NSString *martianSolQueryValueAsString = [martianSolQueryValue stringValue];
    
    NSURLQueryItem *solQuery = [NSURLQueryItem queryItemWithName:martianSolQueryKey  value:martianSolQueryValueAsString];
    
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:apiQueryKey value:apiQueryValue];
    
    roverSolURLComponents.queryItems = [NSArray arrayWithObjects:solQuery, apiQuery, nil];
    
    NSURL *roverSolSearchURL = roverSolURLComponents.URL;
    
    return roverSolSearchURL;
}


#pragma GET method to retrieve an array of all available Mars Rovers

+ (void)fetchAllMarsRoversWithCompletion:(void (^)(NSArray<NSString *> *, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    NSURLComponents *roversFetchURLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    roversFetchURLComponents.path = roversPath;
    
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
            NSLog(@"there was  no data > RoverClient line 117: %@", error.localizedDescription);
            completion(nil, error);
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *rovers = jsonDictionary[@"rovers"];
        
        completion(rovers, nil);
        
    }].resume;

}


#pragma GET method to retrieve mission manifests for individual rover by name of Mars Rover

+ (void)fetchMissionManifestForRoverNamed:(NSString *)roverNamed completion:(void (^)(MGDRover *, NSError *))completion
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


#pragma GET method to retrieve NSArray of photot objects which contain relevant image URLs by Mars Rover name and MArtian Sol date

+ (void)fetchPhotosFromRover:(MGDRover *)rover martianSol:(NSNumber *)martianSol completion:(void (^)(NSArray<UIImage *> *, NSError *))completion
{
    NSURL *fetchURLForPhotosFromIndividualRover = [MGDMarsRoverClient urlForPhotosFromRover:rover martianSolQueryValue:martianSol];
    
    [[NSURLSession sharedSession]dataTaskWithURL:fetchURLForPhotosFromIndividualRover completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"there was an error > MGDMarsRoverClient line 179: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"there was no data > MGDMarsRoverClient line 185: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *photos = jsonDictionary[@"photos"];
        
        completion(photos, nil);
        
    }].resume;
    
}


#pragma GT method to retrieve NSData for photos

+ (void)fetchImageDataForPhoto:(MGDRoverPhoto *)photo completion:(void (^)(NSData *, NSError *))completion
{
    NSURL *imageURL = [NSURL URLWithString:photo.imageURL];
    
    [[NSURLSession sharedSession]dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"there was an error > RoverClient line 210: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSLog(@"there was no data > RoverClient line 216: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        NSData *imageData = [NSData dataWithData:data];
        
        completion(imageData, nil);
        
    }].resume;
    
}




@end










































