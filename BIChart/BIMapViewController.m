//
//  BIMapViewController.m
//  BIChart
//
//  Created by Wei Mao on 9/3/12.
//  Copyright (c) 2012 Wei Mao. All rights reserved.
//

#import "BIMapViewController.h"

@interface BIMapViewController ()
{
    ScatterChartCPView *scatterChartView;
    CGRect tempFrame;
    BOOL isZoom1;
    BOOL isZoom2;
    BOOL isZoom3;
    BOOL isZoom4;
    NSArray *hainanData;
    NSArray *EastNorthData;
    NSArray *EastNorthData1;
    NSArray *EastNorthData2;

    NSArray *WestNorthData;
    NSArray *WestNorthData1;
    NSArray *WestNorthData2;
    NSArray *WestNorthData3;
    
    NSArray *WestSouthData;
    NSArray *WestSouthData1;
    NSArray *WestSouthData2;
    NSArray *WestSouthData3;
    
    NSArray *EastSouthData;
    NSArray *EastSouthData1;
    NSArray *EastSouthData2;
    
    NSArray *TaiWanData;
    
    NSArray *nameArray;
    NSArray *tableNameArray;
    
    //曲线的数据
    NSArray *oneData1;
    NSArray *oneData2;
    
    NSArray *twoData1;
    NSArray *twoData2;
    NSArray *threeData1;
    NSArray *threeData2;
    NSArray *fourData1;
    NSArray *fourData2;
    NSArray *fiveData1;
    NSArray *fiveData2;
    
    
    NSArray *allCurveData;
    
     
}

@end

@implementation BIMapViewController
@synthesize areaLable;

@synthesize mapView;
@synthesize lable1;
@synthesize lable2;
@synthesize lable3;
@synthesize lable4;
@synthesize lable5;
@synthesize hainanLable;
@synthesize WestNorth_lable1;
 
@synthesize WestNorth_lable2;
@synthesize WestNorth_lable3;
@synthesize EastNorth_lable1;
@synthesize EastNorth_lable2;
@synthesize EastSouth_lable1;
@synthesize EastSouth_lable2;
@synthesize WestSouth_lable1;
@synthesize WestSoth_lable2;
@synthesize WestSouth_lable3;
 
 
@synthesize btn1;
@synthesize btn2;
@synthesize btn3;
@synthesize btn4;
@synthesize btn5;
@synthesize bt6;
@synthesize map2_Bt1;
@synthesize map2_Bt2;
@synthesize map2_Bt3;
@synthesize map1_Bt1;
@synthesize map1_Bt2;
@synthesize map3_Bt1;
@synthesize map3_Bt2;
@synthesize map3_Bt3;
@synthesize map4_Bt1;
@synthesize map4_Bt2;
@synthesize sourceTable,dataArray,btnArray,map2Array,map1Array,map3Arry,map4Arry,lableArray,WestNorth_lableArray,WestSouth_lableArray,EastNorth_lableArray,EastSouth_lableArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)firstSelectedState{
    NSInteger selectedIndex = 0;
    
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
    
    [self.sourceTable selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
    [self firstSelectedState];
  
    
    [super viewDidAppear:animated];
}

-(void)onBack{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
    UIImageView *background=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1025, 704)];
    
    background.image=[UIImage imageNamed:@"bi2.png"];
   // [self.view addSubview:background];
    
    [self.view insertSubview:background atIndex:0];
    
    self.navigationItem.hidesBackButton=YES;
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame=CGRectMake(0, 0, 64, 44);
    
    [bt setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    
    [bt addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithCustomView:bt];
    self.navigationItem.leftBarButtonItem=backItem;
    
  //添加各项数据
    
    self.areaLable.text=@"东北地区";
    hainanData=[NSArray arrayWithObjects:[NSNumber numberWithDouble:2244],[NSNumber numberWithDouble:4835],[NSNumber numberWithDouble:2555],[NSNumber numberWithDouble:3445],[NSNumber numberWithDouble:5835], nil];
    
    EastNorthData=[NSArray arrayWithObjects:[NSNumber numberWithDouble:3344],[NSNumber numberWithDouble:5835],[NSNumber numberWithDouble:2115],[NSNumber numberWithDouble:3835],[NSNumber numberWithDouble:6835], nil];
    EastNorthData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:2344],[NSNumber numberWithDouble:3235],[NSNumber numberWithDouble:2315],[NSNumber numberWithDouble:6835],[NSNumber numberWithDouble:6835], nil];

    EastNorthData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:4344],[NSNumber numberWithDouble:3843],[NSNumber numberWithDouble:5115],[NSNumber numberWithDouble:3135],[NSNumber numberWithDouble:5835], nil];

    
    WestNorthData=[NSArray arrayWithObjects:[NSNumber numberWithDouble:5344],[NSNumber numberWithDouble:1235],[NSNumber numberWithDouble:2235],[NSNumber numberWithDouble:1835],[NSNumber numberWithDouble:6735], nil];

    WestNorthData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:4344],[NSNumber numberWithDouble:3235],[NSNumber numberWithDouble:6115],[NSNumber numberWithDouble:9835],[NSNumber numberWithDouble:2835], nil];

    WestNorthData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:2344],[NSNumber numberWithDouble:6835],[NSNumber numberWithDouble:8115],[NSNumber numberWithDouble:2835],[NSNumber numberWithDouble:8835], nil];

    WestNorthData3=[NSArray arrayWithObjects:[NSNumber numberWithDouble:7344],[NSNumber numberWithDouble:3235],[NSNumber numberWithDouble:3115],[NSNumber numberWithDouble:5835],[NSNumber numberWithDouble:9835], nil];

    
    WestSouthData=[NSArray arrayWithObjects:[NSNumber numberWithDouble:2344],[NSNumber numberWithDouble:3235],[NSNumber numberWithDouble:4115],[NSNumber numberWithDouble:3835],[NSNumber numberWithDouble:4435], nil];

    WestSouthData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:1344],[NSNumber numberWithDouble:6535],[NSNumber numberWithDouble:5115],[NSNumber numberWithDouble:3835],[NSNumber numberWithDouble:3835], nil];

    WestSouthData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:6344],[NSNumber numberWithDouble:4335],[NSNumber numberWithDouble:8115],[NSNumber numberWithDouble:4835],[NSNumber numberWithDouble:7635], nil];

    WestSouthData3=[NSArray arrayWithObjects:[NSNumber numberWithDouble:3744],[NSNumber numberWithDouble:1135],[NSNumber numberWithDouble:3115],[NSNumber numberWithDouble:2835],[NSNumber numberWithDouble:7635], nil];

    EastSouthData=[NSArray arrayWithObjects:[NSNumber numberWithDouble:9344],[NSNumber numberWithDouble:3235],[NSNumber numberWithDouble:2445],[NSNumber numberWithDouble:3835],[NSNumber numberWithDouble:6635], nil];

    EastSouthData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:5344],[NSNumber numberWithDouble:3835],[NSNumber numberWithDouble:7115],[NSNumber numberWithDouble:3785],[NSNumber numberWithDouble:3435], nil];

    EastSouthData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:2344],[NSNumber numberWithDouble:2135],[NSNumber numberWithDouble:4115],[NSNumber numberWithDouble:2135],[NSNumber numberWithDouble:4335], nil];

    TaiWanData=[NSArray arrayWithObjects:[NSNumber numberWithDouble:3244],[NSNumber numberWithDouble:1235],[NSNumber numberWithDouble:5454],[NSNumber numberWithDouble:4421],[NSNumber numberWithDouble:3835], nil];

    //添加曲线的数据
    
    oneData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:30],[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:56],[NSNumber numberWithDouble:90],[NSNumber numberWithDouble:30], nil];
    
    oneData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:80],[NSNumber numberWithDouble:70],[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:3],[NSNumber numberWithDouble:50], nil];
    
    NSArray *arr1=[NSArray arrayWithObjects:oneData1,oneData2, nil];
    twoData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:35],[NSNumber numberWithDouble:43],[NSNumber numberWithDouble:60],[NSNumber numberWithDouble:95],[NSNumber numberWithDouble:34], nil];
    
    twoData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:86],[NSNumber numberWithDouble:75],[NSNumber numberWithDouble:41],[NSNumber numberWithDouble:5],[NSNumber numberWithDouble:70], nil];
     NSArray *arr2=[NSArray arrayWithObjects:twoData1,twoData2, nil];
    threeData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:50],[NSNumber numberWithDouble:56],[NSNumber numberWithDouble:90],[NSNumber numberWithDouble:30], nil];
    
    threeData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:70],[NSNumber numberWithDouble:60],[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:10],[NSNumber numberWithDouble:30], nil];
     NSArray *arr3=[NSArray arrayWithObjects:threeData1,threeData2, nil];
    
    fourData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:10],[NSNumber numberWithDouble:54],[NSNumber numberWithDouble:80],[NSNumber numberWithDouble:57],[NSNumber numberWithDouble:30], nil];
    
    fourData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:89],[NSNumber numberWithDouble:70],[NSNumber numberWithDouble:47],[NSNumber numberWithDouble:3],[NSNumber numberWithDouble:57], nil];
    NSArray *arr4=[NSArray arrayWithObjects:fourData1,fourData2, nil];
    fiveData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:60],[NSNumber numberWithDouble:90],[NSNumber numberWithDouble:25], nil];
    
    fiveData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:86],[NSNumber numberWithDouble:70],[NSNumber numberWithDouble:35],[NSNumber numberWithDouble:19],[NSNumber numberWithDouble:57], nil];
    NSArray *arr5=[NSArray arrayWithObjects: fiveData1, fiveData2, nil];
    
    
    allCurveData=[NSArray arrayWithObjects:arr1,arr2,arr3,arr4,arr5, nil];
   
    mapView.backgroundColor=[UIColor whiteColor];
     
    mapView.hidden=YES;
    
    map1_Bt1.hidden=YES;
    map1_Bt2.hidden=YES;
    
    map2_Bt1.hidden=YES;
    map2_Bt2.hidden=YES;
    map2_Bt3.hidden=YES;
    
    map3_Bt1.hidden=YES;
    map3_Bt2.hidden=YES;
    map3_Bt3.hidden=YES;
    
    map4_Bt1.hidden=YES;
    map4_Bt2.hidden=YES;
    
    
    WestNorth_lable1.hidden=YES;
    WestNorth_lable2.hidden=YES;
    WestNorth_lable3.hidden=YES;
    
    EastNorth_lable1.hidden=YES;
    EastNorth_lable2.hidden=YES;
    
    EastSouth_lable1.hidden=YES;
    EastSouth_lable2.hidden=YES;
    
    WestSouth_lable1.hidden=YES;
    WestSoth_lable2.hidden=YES;
    WestSouth_lable3.hidden=YES;
    
    
    
     
        
    
    btnArray=[[NSArray alloc] initWithObjects:btn1,btn2,btn3,btn4,btn5,bt6, nil];
    
    map2Array=[[NSArray alloc] initWithObjects:map2_Bt1,map2_Bt2,map2_Bt3 , nil];
    map1Array=[[NSArray alloc] initWithObjects:map1_Bt1,map1_Bt2, nil];
    map3Arry=[[NSArray alloc] initWithObjects:map3_Bt1,map3_Bt2,map3_Bt3, nil];
    map4Arry=[[NSArray alloc] initWithObjects:map4_Bt1,map4_Bt2, nil];
    lableArray=[[NSArray alloc] initWithObjects:lable1,lable2,lable3,lable4,lable5,hainanLable, nil];
    
    
    EastNorth_lableArray=[[NSArray alloc] initWithObjects:EastNorth_lable2,EastNorth_lable1,  nil];
    
    EastSouth_lableArray=[[NSArray alloc] initWithObjects:EastSouth_lable2,EastSouth_lable1, nil];
    
    WestNorth_lableArray=[[NSArray alloc] initWithObjects:WestNorth_lable1,WestNorth_lable2,WestNorth_lable3, nil];
    
    WestSouth_lableArray=[[NSArray alloc] initWithObjects:WestSouth_lable1,WestSoth_lable2,WestSouth_lable3, nil];
    
    
    
    
    tableNameArray=[NSArray arrayWithObjects:@"Apple",@"Google",@"Microsoft",@"IBM",@"Yahoo", nil ];
    
    
   nameArray=[NSArray arrayWithObjects:@"1月",@"2月",@"3月",@"4月",@"5月", nil ];
    dataArray=[NSArray arrayWithArray:EastNorthData];
    
    
       
    sourceTable.delegate=self;
    sourceTable.dataSource=self;

    scatterChartView = [[ScatterChartCPView alloc] init];
  
    scatterChartView.frame=CGRectMake(552, 350, 452, 350);
    scatterChartView.fillStyle=ScatterChartGradientFill;
    scatterChartView.xAxisMin=0;
    scatterChartView.xAxisMax=4;
    scatterChartView.yAxisMin=0;
    scatterChartView.yAxisMax=120;
//    scatterChartView.colorfulBarArray=@[[UIColor blueColor],[UIColor greenColor],[UIColor redColor]];
    scatterChartView.graphTitle=@"Area Profit";
    scatterChartView.zoomDelegate=self;
    
    scatterChartView.xAxisTitle=@"";
    scatterChartView.yAxisTitle=@"Profit";
    scatterChartView.graphPaddingBottom=30;
    scatterChartView.graphPaddingRight=15;
    scatterChartView.yAxisTitleOffset=40;
    scatterChartView.graphPaddingLeft=60;
    scatterChartView.delegate=self;
    scatterChartView.drawValueTipChartDelegate=self;
    scatterChartView.parentView=self.view;
    
    scatterChartView.hostView.hostedGraph.fill=[CPTFill fillWithColor:[CPTColor clearColor]];
	scatterChartView.hostView.hostedGraph.plotAreaFrame.fill=[CPTFill fillWithColor:[CPTColor clearColor]];
	
    
    [scatterChartView setNewPlotSource:[self generateScatterPlotSource:0] withAnimation:YES];
    [scatterChartView initChart];
    
    
    [self.view addSubview:scatterChartView];

    NSMutableSet *newAxisLabel = [NSMutableSet set];
    NSArray *xlabels=[NSArray arrayWithObjects:@"1月",@"2月",@"3月",@"4月",@"5月", nil];
	for ( NSUInteger i = 0; i <= 4; i++ ) {
		CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText:[xlabels objectAtIndex:i]
														  textStyle:((CPTXYAxisSet *) scatterChartView.hostView.hostedGraph.axisSet).xAxis.labelTextStyle];
		newLabel.tickLocation = CPTDecimalFromUnsignedInteger(i);
        newLabel.offset		  = ((CPTXYAxisSet *) scatterChartView.hostView.hostedGraph.axisSet).xAxis.labelOffset + ((CPTXYAxisSet *) scatterChartView.hostView.hostedGraph.axisSet).xAxis.majorTickLength / 2.0;
		[newAxisLabel addObject:newLabel];
	}
    
    [scatterChartView setAxis:CPTAxisLabelingPolicyNone axisLabels:newAxisLabel];
    
    static CPTMutableTextStyle *style = nil;
	if (!style) {
		style = [CPTMutableTextStyle textStyle];
		style.color= [CPTColor yellowColor];
		style.fontSize = 16.0f;
		style.fontName = @"Helvetica-Bold";
        style.textAlignment = CPTTextAlignmentCenter;
	}
    static NSNumberFormatter *formatter = nil;
    if (!formatter) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setMaximumFractionDigits:2];
    }
    
    scatterChartView.getValueTipRectBlock = ^(CPTPlot *plot,NSInteger index,NSNumber *price){
        return CGRectMake(0, 0, 120, 40);
    };
}

- (void)viewDidUnload
{
    [self setSourceTable:nil];
    self.dataArray=nil;
    scatterChartView=nil;
   
    [self setBtn1:nil];
    [self setBtn2:nil];
    
    
    [self setBtn3:nil];
    [self setBtn4:nil];
    [self setBtn5:nil];
    [self setMapView:nil];
    
    [self setMap2_Bt1:nil];
    [self setMap2_Bt2:nil];
    [self setMap2_Bt3:nil];
    [self setMap1_Bt1:nil];
    [self setMap1_Bt2:nil];
    [self setMapView:nil];
    [self setMap3_Bt1:nil];
    [self setMap3_Bt2:nil];
    [self setMap3_Bt3:nil];
   
    [self setMap4_Bt1:nil];
    [self setMap4_Bt2:nil];
    [self setLable1:nil];
    [self setLable2:nil];
    [self setLable3:nil];
    [self setLable4:nil];
    [self setLable5:nil];
    
    [self setWestNorth_lable1:nil];
    [self setWestNorth_lable2:nil];
    [self setWestNorth_lable3:nil];
    [self setEastNorth_lable1:nil];
    [self setEastNorth_lable2:nil];
    [self setEastSouth_lable1:nil];
    [self setEastSouth_lable2:nil];
    [self setWestSouth_lable1:nil];
    [self setWestSoth_lable2:nil];
    [self setWestSouth_lable3:nil];
    [self setAreaLable:nil];
    [self setBt6:nil];
    [self setHainanLable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(NSMutableDictionary *)generateScatterPlotSource:(NSInteger)index{
    NSMutableDictionary *dict= [[NSMutableDictionary alloc] initWithCapacity:2];
    NSMutableDictionary *plot1=[[NSMutableDictionary alloc] init];
     
    NSArray *array=[allCurveData objectAtIndex:index];
    NSArray *data1=[array objectAtIndex:0];
    NSArray *data2=[array objectAtIndex:1];
    [plot1 setObject:data1 forKey:@"value"];
    
     NSMutableDictionary *plot2=[[NSMutableDictionary alloc] init];
 
    [plot2 setObject:data2 forKey:@"value"];

    [dict setObject:plot1 forKey:@"A1"];
    [dict setObject:plot2 forKey:@"A2"];
    return dict;
    
}

#pragma mark UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier=@"MapChartViewCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kCellIdentifier];
	}
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
	cell.textLabel.text=[tableNameArray objectAtIndex:indexPath.row];
        // cell.detailTextLabel.text=[NSString stringWithFormat:@"%.2f",(10000.0 * rand() / (double)RAND_MAX)];
     
    cell.detailTextLabel.text=[NSString stringWithFormat:@"    total value    %@",[dataArray objectAtIndex:indexPath.row]];
	return cell;
}

#pragma mark UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [scatterChartView setNewPlotSource:[self generateScatterPlotSource:indexPath.row] withAnimation:YES];
//    
    
}

#pragma mark- DrawValueTipChartDelegate
-(void)drawValueTipRect:(ChartCPBaseView *)view layer:(CPTValueTipRectLayer *)layer context:(CGContextRef)context drawRect:(CGRect)rect plot:(CPTPlot *)plot index:(NSInteger)index price:(NSNumber *)price{
    CGSize shadowOffset	 = CGSizeZero;
    CGFloat shadowRadius = 0.0;
    CPTShadow *myShadow	 = layer.shadow;
    if ( myShadow ) {
        shadowOffset = myShadow.shadowOffset;
        shadowRadius = myShadow.shadowBlurRadius;
    }
    static NSNumberFormatter *formatter = nil;
    if (!formatter) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setMaximumFractionDigits:2];
    }
    NSString *name = [nameArray objectAtIndex:index];
    
    NSString *text = [formatter stringFromNumber:price];
    static CPTMutableTextStyle *style = nil;
    if (!style) {
        style = [CPTMutableTextStyle textStyle];
        style.color= [CPTColor whiteColor];
        style.fontSize = 13.0f;
        style.fontName = @"Helvetica-Bold";
        style.textAlignment = CPTTextAlignmentLeft;
    }
    static CPTMutableTextStyle *style2 = nil;
    if (!style2) {
        style2 = [CPTMutableTextStyle textStyle];
        style2.color= [CPTColor whiteColor];
        style2.fontSize = 13.0f;
        style2.fontName = @"Helvetica-Bold";
        style2.textAlignment = CPTTextAlignmentRight;
    }
    [@"Data" drawInRect:CGRectInset(CGRectMake(5+rect.origin.x, 4+rect.origin.y, 50, 20),
                                    0,
                                    0)
          withTextStyle:style
              inContext:context];
    [@"Price" drawInRect:CGRectInset(CGRectMake(5+rect.origin.x, 22+rect.origin.y, 50, 20),
                                     0,
                                     0)
           withTextStyle:style
               inContext:context];
    [name drawInRect:CGRectInset(CGRectMake(52+rect.origin.x, 4+rect.origin.y, 60, 20),
                                 0,
                                 0)
       withTextStyle:style2
           inContext:context];
    [text drawInRect:CGRectInset(CGRectMake(50+rect.origin.x, 22+rect.origin.y, 60, 20),
                                 0,
                                 0)
       withTextStyle:style2
           inContext:context];
}
-(CGRect)zoomChartRectInSuperView:(ChartCPBaseView *)view{
    return CGRectMake(20, 40, 950, 600);
}

- (IBAction)pinch_it:(UIPinchGestureRecognizer *)sender {
    
    if (sender.state==UIGestureRecognizerStateEnded) {
        if (sender.scale>1.0&& map1_Bt1.hidden==NO) {
            return;
        }
        
       
        if (sender.scale>1.0f) {
           [self.view bringSubviewToFront:btn1]; 
            isZoom1=YES;
            [UIView animateWithDuration:0.5 animations:^{
                tempFrame=btn1.frame;
                btn1.frame=mapView.frame;
            } completion:^(BOOL finished) {
                EastNorth_lable1.hidden=NO;
                EastNorth_lable2.hidden=NO;
                mapView.hidden=NO;
                map1_Bt1.hidden=NO;
                map1_Bt2.hidden=NO;
//                map1_Bt1.frame=CGRectMake(0, 227, 317, 197);
//                map1_Bt2.frame=CGRectMake(244, 41, 295, 304);
                
                map1_Bt1.frame=CGRectMake(4, 278, 295, 182);
                map1_Bt2.frame=CGRectMake(232, 110, 269, 277);
                  
                [self.view bringSubviewToFront:mapView];
                [btn1 removeGestureRecognizer:sender];
                [mapView addGestureRecognizer:sender];
            }];
        }
        
        if (!isZoom1) {
            return;
        }
        if (sender.scale<1.0f) {
            isZoom1=NO;
            mapView.hidden=YES;
            map1_Bt1.hidden=YES;
            map1_Bt2.hidden=YES;
            map1_Bt2.tag=10;
            map1_Bt1.tag=11;
            [UIView animateWithDuration:0.5 animations:^{
                btn1.frame=tempFrame;
                
                
            } completion:^(BOOL finished) {
                //  [view1 removeGestureRecognizer:sender];
                EastNorth_lable1.hidden=YES;
                EastNorth_lable2.hidden=YES;
               [self.view insertSubview:btn1 atIndex:1];
                [mapView removeGestureRecognizer:sender];
                [btn1 addGestureRecognizer:sender];
                
            }];
        }
        

        }
        
}

- (IBAction)pinch_it2:(UIPinchGestureRecognizer *)sender {
     
    if (sender.state==UIGestureRecognizerStateEnded) {
                
        if (sender.scale>1.0&& map2_Bt1.hidden==NO) {
            return;
        }
      
        if (sender.scale>1.0f) {
          [self.view bringSubviewToFront:btn2];     
            isZoom2=YES;
            [UIView animateWithDuration:0.5 animations:^{
                tempFrame=btn2.frame;
                btn2.frame=mapView.frame;
            } completion:^(BOOL finished) {
                //[self.view addSubview:view1];
                
                WestNorth_lable1.hidden=NO;
                WestNorth_lable2.hidden=NO;
                WestNorth_lable3.hidden=NO;
                mapView.hidden=NO;
                map2_Bt1.hidden=NO;
                map2_Bt2.hidden=NO;
                map2_Bt3.hidden=NO;
                map2_Bt1.frame=CGRectMake(8, 15, 292, 232);
                map2_Bt2.frame=CGRectMake(179, 114,202, 228);
                map2_Bt3.frame=CGRectMake(279,218, 226, 134);
                
                [self.view bringSubviewToFront:mapView];
                [btn2 removeGestureRecognizer:sender];
                 [mapView addGestureRecognizer:sender];
            }];
        } 
        
        if (!isZoom2) {
            return;
        }
        if (sender.scale<1.0f){
            isZoom2=NO;
            mapView.hidden=YES;
            map2_Bt1.hidden=YES;
            map2_Bt2.hidden=YES;
            map2_Bt3.hidden=YES;
            map2_Bt1.tag=12;
            map2_Bt2.tag=13;
            map2_Bt3.tag=14;
            [UIView animateWithDuration:0.5 animations:^{
                btn2.frame=tempFrame;
            } completion:^(BOOL finished) {
                WestNorth_lable1.hidden=YES;
                WestNorth_lable2.hidden=YES;
                WestNorth_lable3.hidden=YES;
                [self.view insertSubview:btn2 atIndex:3];
                [mapView removeGestureRecognizer:sender];
                [btn2 addGestureRecognizer:sender];
            }];
        }
        

        }
         

}

- (IBAction)toSmall:(id)sender {
    UIButton *btn=(UIButton *)sender;
    [UIView animateWithDuration:1 animations:^{
        btn.frame=CGRectMake(89, 210, 91, 99);
    }];}

- (IBAction)floatOut:(id)sender {
   
   
    UIButton *btn=(UIButton *)sender;
    
    if (btn==btn1) {
        dataArray=EastNorthData;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:0] withAnimation:YES];
        self.areaLable.text=@"东北地区";
    }
    if (btn==btn2) {
        dataArray=WestNorthData;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:1] withAnimation:YES];
        self.areaLable.text=@"西北地区";
        
    }
    if (btn==btn3) {
        dataArray=WestSouthData;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:2] withAnimation:YES];
        self.areaLable.text=@"西南地区";
        
    }
    if (btn==btn4) {
        dataArray=EastSouthData;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:3] withAnimation:YES];
        self.areaLable.text=@"东南地区";
    }
    if (btn==btn5) {
        dataArray=TaiWanData;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:4] withAnimation:YES];
        self.areaLable.text=@"台湾地区";

    }
    
    if (btn==bt6) {
        
        dataArray=hainanData;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:4] withAnimation:YES];
        self.areaLable.text=@"海南";
        
        
    }
    
    if (btn.tag==1) {
        return;
    }
    
    
    for (int i=0; i<6; i++) {
         
        UIButton *tempBt=[btnArray objectAtIndex:i];
         
        if (tempBt.tag==1) {
            NSInteger index= [btnArray indexOfObject:tempBt]; 
            UILabel *lable=[lableArray objectAtIndex:index];
            CGRect frame2=tempBt.frame;
            CGRect lableFrame=lable.frame;

            frame2.origin.x-=10;
            frame2.origin.y+=10;
            lableFrame.origin.x-=10;
            lableFrame.origin.y+=10;
            [UIView animateWithDuration:0.5 animations:^{
                tempBt.frame=frame2;
                lable.frame=lableFrame;
            }];
            
            
            if (tempBt==btn1) {
                [self.view insertSubview:tempBt atIndex:1];
            }
            if (tempBt==btn2) {
                [self.view insertSubview:tempBt atIndex:3];
            }
            if (tempBt==btn3) {
                [self.view insertSubview:tempBt atIndex:4];
            }
            if (tempBt==btn4) {
                [self.view insertSubview:tempBt atIndex:5];
            }
             


                    
        tempBt.tag=0;
            
            
        }
        
        
    }
    
     
   NSInteger index= [btnArray indexOfObject:btn];
    
    UILabel *lable=[lableArray objectAtIndex:index];
    CGRect frame=btn.frame;
    CGRect lableFrame=lable.frame;
    frame.origin.x+=10;
    frame.origin.y-=10;
    
    lableFrame.origin.x+=10;
    lableFrame.origin.y-=10;
    [UIView animateWithDuration:0.5 animations:^{
        btn.frame=frame;
        lable.frame=lableFrame;
    }];
    [ self.view bringSubviewToFront:btn];
    [self.view bringSubviewToFront:lable];
    btn.tag=1;
}

- (IBAction)map2:(id)sender {
    UIButton *btn=(UIButton *)sender;
    if (btn==map2_Bt1) {
        dataArray=WestNorthData1;
        [sourceTable reloadData];
        [self firstSelectedState];
        
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:4] withAnimation:YES];
        self.areaLable.text=@"西北地区-A";
        
        
    }
    if (btn==map2_Bt2) {
        dataArray=WestNorthData2;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:3] withAnimation:YES];
        self.areaLable.text=@"西北地区-B";
    }
    if (btn==map2_Bt3) {
        dataArray=WestNorthData3;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:2] withAnimation:YES];
        self.areaLable.text=@"西北地区-C";
    }
    
    
    
    
    
        if (btn.tag==1) {
        return;
    }
    
    
    for (int i=0; i<3; i++) {
        
        UIButton *tempBt=[map2Array objectAtIndex:i];
        if (tempBt.tag==1) {
            NSInteger index= [map2Array indexOfObject:tempBt]; 
            UILabel *lable=[WestNorth_lableArray  objectAtIndex:index];
            CGRect frame2=tempBt.frame;
            CGRect lableFrame=lable.frame;
            
            frame2.origin.x-=10;
            frame2.origin.y+=10;
            lableFrame.origin.x-=10;
            lableFrame.origin.y+=10;
            [UIView animateWithDuration:0.5 animations:^{
                lable.frame=lableFrame;
                tempBt.frame=frame2;
            }];
            tempBt.tag=0;
            
            
        }
        
        
    }
    NSInteger index= [map2Array indexOfObject:btn]; 
    UILabel *lable=[WestNorth_lableArray  objectAtIndex:index];
    CGRect frame=btn.frame;
    CGRect lableFrame=lable.frame;


    frame.origin.x+=10;
    frame.origin.y-=10;
    lableFrame.origin.x+=10;
    lableFrame.origin.y-=10;
    [UIView animateWithDuration:0.5 animations:^{
        btn.frame=frame;
        lable.frame=lableFrame;

    }];
    [mapView bringSubviewToFront:lable];
  //  [ mapView bringSubviewToFront:btn];
    btn.tag=1;

        
    
}

- (IBAction)map1:(id)sender {
    
    UIButton *btn=(UIButton *)sender;
    if (btn==map1_Bt1) {
        dataArray=EastNorthData1;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:2] withAnimation:YES];
        self.areaLable.text=@"东北地区-B";
    
    }
    if (btn==map1_Bt2) {
        dataArray=EastNorthData2;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:1] withAnimation:YES];
        self.areaLable.text=@"东北地区-A";
        
    }
    if (btn.tag==1) {
        return;
    }
    
    
    for (int i=0; i<2; i++) {
        
        UIButton *tempBt=[map1Array  objectAtIndex:i];
        if (tempBt.tag==1) {
            NSInteger index= [map1Array indexOfObject:tempBt]; 
            UILabel *lable=[EastNorth_lableArray  objectAtIndex:index];
            CGRect frame2=tempBt.frame;
            CGRect lableFrame=lable.frame;

            
            
            
            frame2.origin.x-=10;
            frame2.origin.y+=10;
            lableFrame.origin.x-=10;
            lableFrame.origin.y+=10;
            [UIView animateWithDuration:0.5 animations:^{
                 lable.frame=lableFrame;
                tempBt.frame=frame2;
            }];
            tempBt.tag=0;
            
            
        }
        
        
    }
    NSInteger index= [map1Array indexOfObject:btn];
    
    UILabel *lable=[EastNorth_lableArray objectAtIndex:index];
    CGRect frame=btn.frame;
    CGRect lableFrame=lable.frame;
 
    frame.origin.x+=10;
    frame.origin.y-=10;
    lableFrame.origin.x+=10;
    lableFrame.origin.y-=10;
    [UIView animateWithDuration:0.5 animations:^{
        lable.frame=lableFrame;
        btn.frame=frame;
    }];
  //  [ mapView bringSubviewToFront:btn];
     [mapView bringSubviewToFront:lable];
    btn.tag=1;
    

}

- (IBAction)map3:(id)sender {
    UIButton *btn=(UIButton *)sender;
    if (btn==map3_Bt1) {
        dataArray=WestSouthData1;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:1] withAnimation:YES];
        self.areaLable.text=@"西南地区-A";
    }
    if (btn==map3_Bt2) {
        dataArray=WestSouthData2;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:2] withAnimation:YES];
        self.areaLable.text=@"西南地区-B";
    }
    if (btn==map3_Bt3) {
        dataArray=WestSouthData3;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:3] withAnimation:YES];
        self.areaLable.text=@"西南地区-C";
    }
    
    
    
    if (btn.tag==1) {
        return;
    }
    
    
    for (int i=0; i<3; i++) {
        
        UIButton *tempBt=[map3Arry  objectAtIndex:i];
        if (tempBt.tag==1) {
            
            NSInteger index= [map3Arry indexOfObject:tempBt]; 
            UILabel *lable=[WestSouth_lableArray  objectAtIndex:index];
            CGRect frame2=tempBt.frame;
            CGRect lableFrame=lable.frame;
            
            
            
            
            frame2.origin.x-=10;
            frame2.origin.y+=10;
            lableFrame.origin.x-=10;
            lableFrame.origin.y+=10;
            [UIView animateWithDuration:0.5 animations:^{
                lable.frame=lableFrame;
                tempBt.frame=frame2;
            }];

            
        tempBt.tag=0;
            
            
        }
        
        
    }
    NSInteger index= [map3Arry indexOfObject:btn]; 
    UILabel *lable=[WestSouth_lableArray  objectAtIndex:index];
    
    
    CGRect frame=btn.frame;
    CGRect lableFrame=lable.frame;
    frame.origin.x+=10;
    frame.origin.y-=10;
    lableFrame.origin.x+=10;
    lableFrame.origin.y-=10;
    [UIView animateWithDuration:0.5 animations:^{
        lable.frame=lableFrame;
        btn.frame=frame;
    }];
    //[ mapView bringSubviewToFront:btn];
     [mapView bringSubviewToFront:lable];
    btn.tag=1;
    

    
    
    
    
    
    
    
}

- (IBAction)map4:(id)sender {
    UIButton *btn=(UIButton *)sender;
    if (btn==map4_Bt1) {
        dataArray=EastSouthData1;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:2] withAnimation:YES];
        self.areaLable.text=@"东南地区-B";
    }
    if (btn==map4_Bt2) {
        dataArray=EastSouthData2;
        [sourceTable reloadData];
        [self firstSelectedState];
        [scatterChartView setNewPlotSource:[self generateScatterPlotSource:3] withAnimation:YES];
        self.areaLable.text=@"东南地区-A";
    }
    
    
    
    
    
    if (btn.tag==1) {
        return;
    }
    
    
    for (int i=0; i<2; i++) {
        
        UIButton *tempBt=[map4Arry  objectAtIndex:i];
        if (tempBt.tag==1) {
            
            NSInteger index= [map4Arry indexOfObject:tempBt]; 
            UILabel *lable=[EastSouth_lableArray  objectAtIndex:index];
            CGRect frame2=tempBt.frame;
            CGRect lableFrame=lable.frame;

            frame2.origin.x-=10;
            frame2.origin.y+=10;
            lableFrame.origin.x-=10;
            lableFrame.origin.y+=10;

            
            [UIView animateWithDuration:0.5 animations:^{
                lable.frame=lableFrame;
                tempBt.frame=frame2;
            }];
            tempBt.tag=0;
            
            
        }
        
        
    }
    NSInteger index= [map4Arry indexOfObject:btn]; 
    UILabel *lable=[EastSouth_lableArray  objectAtIndex:index];
    
    CGRect lableFrame=lable.frame; 
    CGRect frame=btn.frame;
    frame.origin.x+=10;
    frame.origin.y-=10;
    lableFrame.origin.x+=10;
    lableFrame.origin.y-=10;
    [UIView animateWithDuration:0.5 animations:^{
        lable.frame=lableFrame;
        btn.frame=frame;
    }];
  //  [ mapView bringSubviewToFront:btn];
     [mapView bringSubviewToFront:lable];
    btn.tag=1;
    

    
    
}

- (IBAction)pinch_it3:(UIPinchGestureRecognizer *)sender {
    
     
    if (sender.state==UIGestureRecognizerStateEnded) {
         
        
        if (sender.scale>1.0&& map3_Bt1.hidden==NO) {
            return;
        }
        
        if (sender.scale>1.0f) {
           
        [self.view bringSubviewToFront:btn3];     
            isZoom3=YES;
            [UIView animateWithDuration:0.5 animations:^{
                 lable3.hidden=YES;
                tempFrame=btn3.frame;
                btn3.frame=mapView.frame;
            } completion:^(BOOL finished) {
                //[self.view addSubview:view1];
                WestSouth_lable1.hidden=NO;
                WestSoth_lable2.hidden=NO;
                WestSouth_lable3.hidden=NO;
                mapView.hidden=NO;
                map3_Bt1.hidden=NO;
                map3_Bt2.hidden=NO;
                map3_Bt3.hidden=NO;
                map3_Bt1.frame=CGRectMake(4, 110, 189, 148);
                map3_Bt2.frame=CGRectMake(107,170, 277, 139);
                 
                 map3_Bt3.frame=CGRectMake(281, 204, 218, 203);

                
                [self.view bringSubviewToFront:mapView];
                [btn3 removeGestureRecognizer:sender];
                [mapView addGestureRecognizer:sender];
            }];
        } 
        
        if (!isZoom3) {
            return;
        }
        if (sender.scale<1.0f){
           
            isZoom3=NO;
            mapView.hidden=YES;
            map3_Bt1.hidden=YES;
            map3_Bt2.hidden=YES;
            map3_Bt3.hidden=YES;
            map3_Bt1.tag=20;
            map3_Bt2.tag=21;
            map3_Bt3.tag=22;
            [UIView animateWithDuration:0.5 animations:^{
                 
                btn3.frame=tempFrame;
            } completion:^(BOOL finished) {
                WestSouth_lable1.hidden=YES;
                WestSoth_lable2.hidden=YES;
                WestSouth_lable3.hidden=YES;

                lable3.hidden=NO;
                [self.view insertSubview:btn3 atIndex:4];
                [mapView removeGestureRecognizer:sender];
                [btn3 addGestureRecognizer:sender];
            }];
        }
 
            
        }
        
      
    
    
    
}

- (IBAction)pinch_it4:(UIPinchGestureRecognizer *)sender {
   
    if (sender.state==UIGestureRecognizerStateEnded) {
         
        
        if (sender.scale>1.0&& map4_Bt1.hidden==NO) {
            return;
        }
      
        if (sender.scale>1.0f) {
            [self.view bringSubviewToFront:btn4];
            isZoom4=YES;
            [UIView animateWithDuration:0.5 animations:^{
                lable4.hidden=YES;
                tempFrame=btn4.frame;
                btn4.frame=mapView.frame;
            } completion:^(BOOL finished) {
                 
                EastSouth_lable1.hidden=NO;
                EastSouth_lable2.hidden=NO;
                mapView.hidden=NO;
                map4_Bt1.hidden=NO;
                map4_Bt2.hidden=NO;
                map4_Bt1.frame=CGRectMake(60, 211, 342, 208);
                map4_Bt2.frame=CGRectMake(131, -8, 332, 303);

                
             
                
                [self.view bringSubviewToFront:mapView];
                [btn4 removeGestureRecognizer:sender];
                [mapView addGestureRecognizer:sender];
            }];
        } 
        if (!isZoom4) {
            return;
        }
        
        if (sender.scale<1.0f) {
            isZoom4=NO;
            mapView.hidden=YES;
            map4_Bt1.hidden=YES;
            map4_Bt2.hidden=YES;
            map4_Bt1.tag=24;
            map4_Bt2.tag=25;
            [UIView animateWithDuration:0.5 animations:^{
                btn4.frame=tempFrame;
            } completion:^(BOOL finished) {
                EastSouth_lable1.hidden=YES;
                EastSouth_lable2.hidden=YES;
                lable4.hidden=NO;
                [self.view insertSubview:btn4 atIndex:5];
                [mapView removeGestureRecognizer:sender];
                [btn4 addGestureRecognizer:sender];
            }];
            
        }
    }
       
}


#pragma mark - ZoomTipDelegate
-(UIView *)createTipView:(ChartCPBaseView *)view{
    
    UIView *view2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    view2.backgroundColor = [UIColor clearColor];
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(5, 5, 50, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text=@"Data";
    lbl.tag=1;
    [view2 addSubview:lbl];
    lbl=[[UILabel alloc] initWithFrame:CGRectMake(55, 5, 50, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.tag=2;
    [view2 addSubview:lbl];
    lbl=[[UILabel alloc] initWithFrame:CGRectMake(5, 25, 50, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text=@"Price";
    lbl.tag=3;
    [view2 addSubview:lbl];
    lbl=[[UILabel alloc] initWithFrame:CGRectMake(55, 25, 50, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.tag=4;
    [view2 addSubview:lbl];
    return view2;
    
}
-(CGRect)resetTipSize:(ChartCPBaseView *)view tipView:(UIView *)tipView{
    return CGRectMake(0, 0, 200, 50);
}
-(void)relayoutTipView:(ChartCPBaseView *)view tipView:(UIView *)tipView mode:(UITipViewMaskMode)maskMode{
  //  UILabel *lbl=(UILabel *)[tipView viewWithTag:2];
    UILabel *lbl1=(UILabel *)[tipView viewWithTag:1];
    UILabel *lbl2=(UILabel *)[tipView viewWithTag:2];
    UILabel *lbl3=(UILabel *)[tipView viewWithTag:3];
    UILabel *lbl4=(UILabel *)[tipView viewWithTag:4];
    static NSNumberFormatter *formatter = nil;
    if (!formatter) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setMaximumFractionDigits:2];
    }
    int offset=50;
    switch (maskMode) {
        case UITipViewMaskLeftMode:
            //            frame
            //            cview.frame=CGRectMake(0, 0, 230, 50);
            lbl1.frame=CGRectMake(5+offset, 5, lbl1.frame.size.width, lbl1.frame.size.height);
            lbl2.frame=CGRectMake(55+offset, 5, lbl2.frame.size.width, lbl2.frame.size.height);
            lbl3.frame=CGRectMake(5+offset, 25, lbl3.frame.size.width, lbl3.frame.size.height);
            lbl4.frame=CGRectMake(55+offset, 25, lbl4.frame.size.width, lbl4.frame.size.height);
            
            break;
        case UITipViewMaskRightMode:
            //            cview.frame=CGRectMake(30, 0, 200, 50);
            lbl1.frame=CGRectMake(5, 5, lbl1.frame.size.width, lbl1.frame.size.height);
            lbl2.frame=CGRectMake(55, 5, lbl2.frame.size.width, lbl2.frame.size.height);
            lbl3.frame=CGRectMake(5, 25, lbl3.frame.size.width, lbl3.frame.size.height);
            lbl4.frame=CGRectMake(55, 25, lbl4.frame.size.width, lbl4.frame.size.height);
            
            break;
        default:
            break;
    }
    NSString *name = [nameArray objectAtIndex:view.selectIndex];
    lbl2.text=name;
    NSString *text = [formatter stringFromNumber:view.selectPrice];
    lbl4.text=text;
//    NSString *name = [nameArray objectAtIndex:view.selectIndex];
//    lbl.text=name;
//    NSString *text = [formatter stringFromNumber:view.selectPrice];
//    lbl=(UILabel *)[tipView viewWithTag:4];
//    lbl.text=text;
}
@end
