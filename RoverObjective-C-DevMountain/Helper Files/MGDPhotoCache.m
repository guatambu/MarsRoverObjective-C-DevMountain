//
//  MGDPhotoCache.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/7/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDPhotoCache.h"




@implementation MGDPhotoCache

+(NSCache *)privateCache
{
    NSCache *privateCache = [[NSCache alloc]init];
    privateCache.name = @"com.DevMountain.MarsRover.PhotosCache";
    return privateCache;
}


+(MGDPhotoCache *)sharedCache
{
    static MGDPhotoCache *sharedCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCache = [MGDPhotoCache new];
    });
    return sharedCache;
}


-(void)cacheImageDataForIdentifier:(NSInteger *)identifier data:(NSData *)data
{
    NSString *identifierAsString = [NSString stringWithFormat: @"%ld", (long)identifier];
    
    [[MGDPhotoCache privateCache] setObject:data forKey:identifierAsString];
}


-(NSData *)imageDataForIdentifier:(NSInteger *)identifier
{
    NSString *identifierAsString = [NSString stringWithFormat: @"%ld", (long)identifier];
    
    NSData *data = [[MGDPhotoCache privateCache] objectForKey:identifierAsString];
    
    return data;
}


@end






































