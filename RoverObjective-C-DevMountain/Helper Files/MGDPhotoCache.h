//
//  MGDPhotoCache.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/7/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDPhotoCache : NSObject

+ (MGDPhotoCache *)sharedCache;

- (void) cacheImageDataForIdentifier:(NSInteger *)identifier data:(NSData *)data;

- (NSData *) imageDataForIdentifier:(NSInteger *)identifier;


@end
