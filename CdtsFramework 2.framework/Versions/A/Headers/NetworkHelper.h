//
//  NetworkHelper.h
//  CdtsFramework
//
//  Created by 山天 大畜 on 7/05/12.
//  Copyright (c) 2012 iSoftStone. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkDelegate <NSObject>

@optional
-(void) network_NotReachable;
-(void) network_ReachableViaWWAN;
-(void) network_ReachableViaWiFi;

@end

@interface NetworkHelper : NSObject

@property(assign,nonatomic) id<NetworkDelegate> delegate;
@property(strong,nonatomic) NSString *reachUrl;

-(void) listenNetwork;

@end
