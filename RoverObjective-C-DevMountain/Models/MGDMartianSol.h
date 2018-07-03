//
//  MGDMartianSol.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGDMartianSol : NSObject

#pragma properties

@property (nonatomic, readonly)NSNumber *martianSol;
@property (nonatomic, readonly)NSNumber *numberOfPhotosTakenDuringSol;
@property (nonatomic, readonly)NSArray *cameras;

#pragma initializer

- (instancetype) initWithMartianSol:(NSNumber *)martianSol
       numberOfPhotosTakenDuringSol:(NSNumber *)numberOfPhotosTakenDuringSol
                            cameras:(NSString *)cameras;

#pragma convenience initializer with dictionary

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
