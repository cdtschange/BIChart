//
//  ImageSlide.h
//  CdtsFramework
//
//  Created by Change Cdts on 12-4-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ImageSlideDelegate <NSObject>

@required
- (void)onClickOnce;
- (void)animationDidStop;

@optional
- (void)startMove;

@end

enum {
    None=0,
    LeftRight=1<<0,
    TopBottom=1<<1,
    LeftRightTopBottom=LeftRight|TopBottom
} typedef Direction;


@interface ImageSlide : NSObject{
    CGPoint startPoint;
    CGPoint endPoint;
    BOOL isAnimationing;
    NSMutableArray *sourceList;
    UIImageView *curImageView;
    UIImageView *tmpImageView;
    UIImageView *vimage1;
    UIImageView *vimage2;
}

@property(assign,nonatomic) double MOVE_MIN_DISTANCE;
@property(assign,nonatomic) id<ImageSlideDelegate> delegate;
@property(assign,nonatomic) Direction direction;
@property(assign,nonatomic) int currentImgIndex;
@property(assign,nonatomic) double duration;


- (ImageSlide *) initWithSource: (NSMutableArray *) source withStartIndex: (int) startIndex withImageView1:(UIImageView *)imgv1 withImageView2:(UIImageView *)imgv2;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView *)view;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event withView:(UIView *)view;

-(void)imgFromLeft;
-(void)imgFromRight;
-(void)imgFromTop;
-(void)imgFromBottom;
- (void)myAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
-(void)deleteImage;


@end
