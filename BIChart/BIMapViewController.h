//
//  BIMapViewController.h
//  BIChart
//
//  Created by Wei Mao on 9/3/12.
//  Copyright (c) 2012 Wei Mao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ISSFramework/OBShapedButton.h>

@interface BIMapViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DrawValueTipChartDelegate,ChartCPBaseViewDelegate,ZoomTipDelegate>


@property (strong, nonatomic) NSArray *dataArray;

@property (strong, nonatomic) IBOutlet OBShapedButton *btn1;
@property (strong, nonatomic) IBOutlet OBShapedButton *btn2;
@property (strong, nonatomic) IBOutlet OBShapedButton *btn3;
 
@property (strong, nonatomic) IBOutlet OBShapedButton *btn4;
@property (strong, nonatomic) IBOutlet OBShapedButton *bt6;
@property (strong, nonatomic) IBOutlet OBShapedButton *btn5;
@property (strong, nonatomic) IBOutlet OBShapedButton *map2_Bt1;

@property (strong, nonatomic) IBOutlet OBShapedButton *map2_Bt2;
@property (strong, nonatomic) IBOutlet OBShapedButton *map2_Bt3;
@property (strong, nonatomic) IBOutlet OBShapedButton *map1_Bt1;
@property (strong, nonatomic) IBOutlet OBShapedButton *map1_Bt2;
@property (strong, nonatomic) IBOutlet OBShapedButton *map3_Bt1;
@property (strong, nonatomic) IBOutlet OBShapedButton *map3_Bt2;
@property (strong, nonatomic) IBOutlet OBShapedButton *map3_Bt3;
@property (strong, nonatomic) IBOutlet OBShapedButton *map4_Bt1;
@property (strong, nonatomic) IBOutlet OBShapedButton *map4_Bt2;
@property (strong, nonatomic) IBOutlet UITableView *sourceTable;
@property(strong,nonatomic)NSArray *btnArray;
@property(strong,nonatomic)NSArray *lableArray;
@property(strong,nonatomic)NSArray *map2Array;
@property(strong,nonatomic)NSArray *map1Array;
@property(strong,nonatomic)NSArray *map3Arry;
@property(strong,nonatomic)NSArray *map4Arry;
@property (strong, nonatomic) IBOutlet UIView *mapView;
@property (strong, nonatomic) IBOutlet UILabel *lable1;
@property (strong, nonatomic) IBOutlet UILabel *lable2;
@property (strong, nonatomic) IBOutlet UILabel *lable3;
@property (strong, nonatomic) IBOutlet UILabel *lable4;
@property (strong, nonatomic) IBOutlet UILabel *lable5;
 
 
@property (strong, nonatomic) IBOutlet UILabel *WestNorth_lable1;

@property (strong, nonatomic) IBOutlet UILabel *WestNorth_lable2;
@property (strong, nonatomic) IBOutlet UILabel *WestNorth_lable3;
@property (strong, nonatomic) IBOutlet UILabel *EastNorth_lable1;
@property (strong, nonatomic) IBOutlet UILabel *EastNorth_lable2;
@property (strong, nonatomic) IBOutlet UILabel *EastSouth_lable1;
@property (strong, nonatomic) IBOutlet UILabel *EastSouth_lable2;
@property (strong, nonatomic) IBOutlet UILabel *WestSouth_lable1;
@property (strong, nonatomic) IBOutlet UILabel *WestSoth_lable2;
@property (strong, nonatomic) IBOutlet UILabel *WestSouth_lable3;
@property(strong,nonatomic)NSArray *WestNorth_lableArray;
@property(strong,nonatomic)NSArray *EastNorth_lableArray;
@property(strong,nonatomic)NSArray *EastSouth_lableArray;
@property(strong,nonatomic)NSArray *WestSouth_lableArray;
@property (strong, nonatomic) IBOutlet UILabel *areaLable;

@property (strong, nonatomic) IBOutlet UILabel *hainanLable;

- (IBAction)pinch_it:(UIPinchGestureRecognizer *)sender;
- (IBAction)pinch_it2:(UIPinchGestureRecognizer *)sender;
- (IBAction)toSmall:(id)sender;
- (IBAction)floatOut:(id)sender;
- (IBAction)map2:(id)sender;
- (IBAction)map1:(id)sender;
- (IBAction)map3:(id)sender;
- (IBAction)map4:(id)sender;
- (IBAction)pinch_it3:(UIPinchGestureRecognizer *)sender;

- (IBAction)pinch_it4:(UIPinchGestureRecognizer *)sender;

 
@end
