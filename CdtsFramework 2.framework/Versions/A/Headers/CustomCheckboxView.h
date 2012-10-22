//
//  CheckboxView.h
//  CdtsFramework
//
//  Created by 山天 大畜 on 4/05/12.
//  Copyright (c) 2012 iSoftStone. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomCheckboxViewDelegate <NSObject>

@optional
-(void) checkboxView_check:(id)sender checked:(BOOL)checked;

@end

@interface CustomCheckboxView : UIView

@property(assign,nonatomic) id<CustomCheckboxViewDelegate> delegate;


@property(nonatomic,assign) BOOL isChecked;

- (void)check:(BOOL)checked;
- (id)initWithFrame:(CGRect)frame checkedImg:(NSString *)checkedImg uncheckedImg:(NSString *)uncheckedImg;

@end
