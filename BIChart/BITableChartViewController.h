//
//  BITableChartViewController.h
//  BIChart
//
//  Created by Wei Mao on 8/27/12.
//  Copyright (c) 2012 Wei Mao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BITableChartViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DrawValueTipChartDelegate,ChartCPBaseViewDelegate,ZoomTipDelegate>

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *dataTableView;

@end
