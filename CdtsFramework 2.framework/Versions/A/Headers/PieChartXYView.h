//
//  PieChartXYViewController.h
//  CdtsFramework
//
//  Created by Wei Mao on 8/27/12.
//
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@protocol DidSelectSliceChartDelegate <NSObject>

@optional
// 绘制内容区域
- (void)didSelectSliceAtIndex:(NSInteger)index price:(NSNumber *)price;
@end

@interface PieChartXYView : UIView<XYPieChartDelegate, XYPieChartDataSource>


@property (strong, nonatomic) XYPieChart *pieChart;

@property(nonatomic, strong) NSMutableDictionary *plotSource;
@property(nonatomic, strong) NSArray *sliceColors;
@property(nonatomic, assign) double animationSpeed;
@property(nonatomic, assign) double labelRadius;
@property (assign, nonatomic) id<DidSelectSliceChartDelegate> didSelectSliceChartDelegate;

-(void)initChart;

@end
