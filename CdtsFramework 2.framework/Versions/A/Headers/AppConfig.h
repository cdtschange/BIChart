//
//  AppConfig.h
//  CdtsFramework
//
//  Created by Change Cdts on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppConfig : NSObject {
    
}
@property(nonatomic,assign) float version;
@property(nonatomic,assign) BOOL isFree;
@property(nonatomic,strong) NSString *appName;
@property(nonatomic,strong) NSString *appID;
@property(nonatomic,strong) NSString *adMobAdUnitID;
@property(nonatomic,strong) NSString *subject;
@property(nonatomic,strong) NSString *emailBody;
@property(nonatomic,strong) NSString *smsBody;
@property(nonatomic,strong) NSString *linkUrl;
@property(nonatomic,strong) NSString *databaseName;
@property(nonatomic,assign) CGRect contentFrame;
@property(nonatomic,assign) CGRect adFrame;

/// <summary>
/// 单件实例
/// </summary>
/// <returns>XmlQuestionSingleton实例</returns>
+(AppConfig *)GlobalConfig;

@end
