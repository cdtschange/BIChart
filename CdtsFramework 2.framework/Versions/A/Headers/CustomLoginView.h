//
//  LoginView.h
//  CdtsFramework
//
//  Created by 山天 大畜 on 4/05/12.
//  Copyright (c) 2012 iSoftStone. All rights reserved.
//
#define LOGIN_DATA_PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"cdts_login_data.db"]
#define USER_NAME_KEY @"UserName"
#define USER_PWD_KEY @"UserPassword"
#define USER_REMEMBER_NAME_KEY @"RememberName"
#define USER_REMEMBER_PWD_KEY @"RememberPassword"
#define USER_AUTO_LOGIN_KEY @"IsAutoLogin"

#import <UIKit/UIKit.h>

#import "CustomCheckboxView.h"

@protocol CustomLoginViewDelegate <NSObject>

@required
-(void) loginView_login:(NSString *)name withPassword:(NSString *)password;
@optional
-(void) loginView_cancel;
-(void) loginView_forgetPwd:(NSString *)name;
-(void) loginView_changePwd:(NSString *)name;

@end

@class CustomCheckboxView;

@interface CustomLoginView : UIView<UITextFieldDelegate,CustomCheckboxViewDelegate>

@property(assign,nonatomic) id<CustomLoginViewDelegate> delegate;

@property(strong,nonatomic) UIButton *btnForgetPwd;
@property(strong,nonatomic) UIButton *btnChangePwd;
@property(strong,nonatomic) UIImageView *bgImgView;
@property(strong,nonatomic) UIButton *btnLogin;
@property(strong,nonatomic) UIButton *btnCancel;
@property(strong,nonatomic) UITextField *txfName;
@property(strong,nonatomic) UITextField *txfPassword;
@property(strong,nonatomic) CustomCheckboxView *cbRememberName;
@property(strong,nonatomic) CustomCheckboxView *cbRememberPwd;
@property(strong,nonatomic) CustomCheckboxView *cbAutoLogin;
@property(strong,nonatomic) UISwitch *stRememberName;
@property(strong,nonatomic) UISwitch *stRememberPwd;
@property(strong,nonatomic) UISwitch *stAutoLogin;

- (void) setIsRememberName:(BOOL)remember;
- (BOOL) getIsRememberName;
- (void) setIsRememberPwd:(BOOL)remember;
- (BOOL) getIsRememberPwd;
- (void) setIsAutoLogin:(BOOL)remember;
- (BOOL) getIsAutoLogin;
- (void) setName:(NSString *)name;
- (NSString *) getName;
- (void) setPassword:(NSString *)pwd;
- (NSString *) getPassword;

- (void) fillDataInViews;

@end
