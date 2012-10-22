//
//  ADBannerFactory.h
//  CdtsFramework
//
//  Created by Change Cdts on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADBanner.h"

@interface ADBannerFactory : NSObject

+(ADBanner *)createADBanner:(NSString *)name position:(UIADBannerPosition)_position root:(UIViewController *) _root isStatic:(BOOL)_isStatic delegate:(id)_delegate defaultImage:(UIImage *)_defaultImage adID:(NSString *)_adID;

@end
