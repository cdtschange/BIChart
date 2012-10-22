//
//  ADBanner.h
//  CdtsFramework
//
//  Created by Change Cdts on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ADBanner;

typedef enum {
    UIADBannerLeft,
    UIADBannerTop,
    UIADBannerBottom,
    UIADBannerRight
} UIADBannerPosition;

@protocol ADBannerDelegate
-(void)displayADBanner:(ADBanner *)adBanner;
@end

@interface ADModel : NSObject
{
    NSString *adUnitID;
}
@property(nonatomic,strong) NSString *adUnitID; 

@end
/// <summary>
/// 广告组件
/// <summary>
@interface ADBanner : UIView <NSXMLParserDelegate> {
    /// <summary>
    /// 是否是静态
    /// <summary>
    BOOL isStatic;
    
    id<ADBannerDelegate> delegate;    

    /// <summary>
    /// 定时器
    /// <summary>
    NSTimer *timer;
}
/// <summary>
/// 应用的名称
/// <summary>
@property(nonatomic,strong) NSString *appName;
@property(nonatomic,strong) ADModel *adModel;
/// <summary>
/// 请求服务器的地址
/// <summary>
@property(nonatomic,strong) NSString *requestUrl;
/// <summary>
/// 广告组件位置
/// <summary>
@property(nonatomic,assign) UIADBannerPosition position;
/// <summary>
/// 广告视图
/// </summary>
@property (nonatomic, strong) UIView *adBannerView;
/// <summary>
/// 是否显示广告
/// </summary>
@property (nonatomic,assign) BOOL isVisible;

@property(nonatomic,strong) UIViewController *rootViewController;

/// <summary>
/// 初始化组件位置
/// <summary>
- (id)initWithPosition:(UIADBannerPosition)_position root:(UIViewController *) _root isStatic:(BOOL)_isStatic delegate:(id)_delegate defaultImage:(UIImage *)_defaultImage adID:(NSString *)_adID;

-(void)createAD;

/// <summary>
///获取广告的高度
/// </summary>
/// <returns>广告的高度</returns>
- (int)getBannerHeight;

/// <summary>
///网络连接是否正常
/// </summary>
//-(void)netWorkConnect;

/// <summary>
///获取设备信息
/// </summary>
/// <returns>POST传值的字符串</returns>
//-(NSString *)getDeviceInfo;
/// <summary>
/// 显示广告
/// </summary>
-(void)displayADBanner;

/// <summary>
///加载广告的appkey
/// </summary>
//-(void)loadKey;

@end
