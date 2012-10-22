//
//  ResourceUtility.h
//  CdtsFramework
//
//  Created by Change Cdts on 12-3-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResourceUtility : NSObject

+ (NSDictionary *) loadResourceNSDictionary:(NSString *)fileName:(NSString *)fileType;
+ (NSArray *) loadResourceNSArray:(NSString *)fileName:(NSString *)fileType;

@end
