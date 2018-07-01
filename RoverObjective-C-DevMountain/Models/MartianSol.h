//
//  MartianSol.h
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 6/30/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MartianSol : NSObject

@property (nonatomic, readonly)NSNumber *martianSol;
@property (nonatomic, readonly)NSNumber *numberOfPhotosTakenDuringSol;
@property (nonatomic, readonly)NSArray *cameras;

+(instancetype) intiWithMartianSol:(NSNumber *)martianSol
      numberOfPhotosTakenDuringSol:(NSNumber *)numberOfPhotosTakenDuringSol
                           cameras:(NSString *)cameras;

@end
