//
//  BITableChartViewController.m
//  BIChart
//
//  Created by Wei Mao on 8/27/12.
//  Copyright (c) 2012 Wei Mao. All rights reserved.
//

#import "BITableChartViewController.h"

@interface BITableChartViewController ()
{
    BarChartCPView *barChartView;
    
    PieChartCPView *pieChartView2;
    NSMutableArray *chartArray;
    NSMutableArray *allData;
    
    NSMutableArray *barAllData;
    NSArray *names;
    NSArray *xlabels;
    NSArray *barNames;
}
@end

@implementation BITableChartViewController
@synthesize dataTableView;
@synthesize dataArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    NSInteger selectedIndex = 0;
    
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
    
    [self.dataTableView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
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
    
    background.image=[UIImage imageNamed:@"bi1.png"];
   
    
    [self.view insertSubview:background atIndex:0];
    self.navigationItem.hidesBackButton=YES;
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame=CGRectMake(0, 0, 64, 44);
    
    [bt setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    
    [bt addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithCustomView:bt];
    self.navigationItem.leftBarButtonItem=backItem;
    
    
    
    
    
    
    
    
	// Do any additional setup after loading the view.
    dataArray = [NSArray arrayWithObjects:@"ISofStone",@"Apple",@"Google",@"Microsoft",@"IBM",@"Baidu",@"Lenovo",@"HuaWei",@"ZIE", nil ];
    NSArray *data1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:3338] ,[NSNumber numberWithDouble:4338],[NSNumber numberWithDouble:3286],[NSNumber numberWithDouble:5438], nil];
     NSArray *data2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:3131] ,[NSNumber numberWithDouble:4554],[NSNumber numberWithDouble:7676],[NSNumber numberWithDouble:1213], nil];
     NSArray *data3=[NSArray arrayWithObjects:[NSNumber numberWithDouble:4345] ,[NSNumber numberWithDouble:6567],[NSNumber numberWithDouble:3234],[NSNumber numberWithDouble:5462], nil];
     NSArray *data4=[NSArray arrayWithObjects:[NSNumber numberWithDouble:1241] ,[NSNumber numberWithDouble:5462],[NSNumber numberWithDouble:4134],[NSNumber numberWithFloat:7682], nil];
     NSArray *data5=[NSArray arrayWithObjects:[NSNumber numberWithDouble:4351] ,[NSNumber numberWithDouble:6781],[NSNumber numberWithDouble:3256],[NSNumber numberWithDouble:1345], nil];
     NSArray *data6=[NSArray arrayWithObjects:[NSNumber numberWithDouble:5562] ,[NSNumber numberWithFloat:7672],[NSNumber numberWithDouble:4321],[NSNumber numberWithDouble:4451], nil];
     NSArray *data7=[NSArray arrayWithObjects:[NSNumber numberWithDouble:4411] ,[NSNumber numberWithDouble:6572],[NSNumber numberWithDouble:1123],[NSNumber numberWithDouble:5466], nil];
     NSArray *data8=[NSArray arrayWithObjects:[NSNumber numberWithDouble:1213] ,[NSNumber numberWithFloat:6532],[NSNumber numberWithDouble:2311],[NSNumber numberWithDouble:6788], nil];
     NSArray *data9=[NSArray arrayWithObjects:[NSNumber numberWithDouble:1221] ,[NSNumber numberWithDouble:6661],[NSNumber numberWithDouble:3338],[NSNumber numberWithDouble:4242], nil];
        
    allData=[NSMutableArray arrayWithObjects:data1,data2,data3,data4,data5,data6,data7,data8,data9, nil];  
    
    names=[NSArray arrayWithObjects:@"Returns",@"Exposure",@"Province Allocated",@"Capital", nil];
    
        //柱图的数据
   NSArray * barData1=[NSArray arrayWithObjects:[NSNumber numberWithDouble:50],[NSNumber numberWithDouble:80],[NSNumber numberWithDouble:90],[NSNumber numberWithDouble:50],[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:70], nil];
    NSArray * barData2=[NSArray arrayWithObjects:[NSNumber numberWithDouble:30],[NSNumber numberWithDouble:20],[NSNumber numberWithDouble:10],[NSNumber numberWithDouble:60],[NSNumber numberWithDouble:50],[NSNumber numberWithDouble:70], nil];
    NSArray * barData3=[NSArray arrayWithObjects:[NSNumber numberWithDouble:60],[NSNumber numberWithDouble:50],[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:30],[NSNumber numberWithDouble:50],[NSNumber numberWithDouble:80], nil];
    NSArray * barData4=[NSArray arrayWithObjects:[NSNumber numberWithDouble:45],[NSNumber numberWithDouble:40],[NSNumber numberWithDouble:30],[NSNumber numberWithDouble:20],[NSNumber numberWithDouble:50],[NSNumber numberWithDouble:90], nil];    
    barAllData=[NSArray arrayWithObjects:barData1,barData2,barData3,barData4,nil];
    
    
    
    
    
    
    
    
    
        dataTableView.delegate=self;
    dataTableView.dataSource=self;

    
    barChartView = [[BarChartCPView alloc] init];
    barChartView.frame=CGRectMake(517, 65, 485, 348);
    barChartView.xAxisMin=0;
    barChartView.xAxisMax=7.0;
    barChartView.yAxisMin=0;
    barChartView.yAxisMax=120;
    barChartView.barWidth=0.9;
    barChartView.barInitX=1;
    barChartView.colorfulBar=YES;
    barChartView.graphTitle=@"Returns by State";
    
    barChartView.xAxisTitle=@"";
    barChartView.yAxisTitle=@"Returns(millions)";
    barChartView.graphPaddingBottom=30;
    barChartView.graphPaddingRight=5;
    barChartView.yAxisTitleOffset=40;
    barChartView.graphPaddingLeft=60;
    barChartView.delegate=self;
    barChartView.drawValueTipChartDelegate=self;
    barChartView.zoomDelegate=self;
    barChartView.parentView=self.view;
    
    barChartView.hostView.hostedGraph.fill=[CPTFill fillWithColor:[CPTColor yellowColor]];
	barChartView.hostView.hostedGraph.plotAreaFrame.fill=[CPTFill fillWithColor:[CPTColor yellowColor]];
	
    
    [barChartView setNewPlotSource:[self generateBarPlotSource:0] withAnimation:YES];
    [barChartView initChart];
    

    [self.view addSubview:barChartView];
    
    NSMutableSet *newAxisLabel = [NSMutableSet set];
    barNames=[NSArray arrayWithObjects:@"EastNorth",@"WestNorth",@"EastSouth",@"WestSouth",@"Hongkong ",@"TaiWan", nil];
    xlabels=[NSArray arrayWithObjects:@"EN",@"WN",@"ES",@"WS",@"HK",@"TW", nil];
 //   NSArray *xlabels=[@"CA",@"OR",@"WA"];
   
	for ( NSUInteger i = 1; i <= 6; i++ ) {
		CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText:[xlabels objectAtIndex:i-1]
														  textStyle:((CPTXYAxisSet *) barChartView.hostView.hostedGraph.axisSet).xAxis.labelTextStyle];
		newLabel.tickLocation = CPTDecimalFromUnsignedInteger(i);
        newLabel.offset		  = ((CPTXYAxisSet *) barChartView.hostView.hostedGraph.axisSet).xAxis.labelOffset + ((CPTXYAxisSet *) barChartView.hostView.hostedGraph.axisSet).xAxis.majorTickLength / 2.0;
		[newAxisLabel addObject:newLabel];
	}
    
    [barChartView setAxis:CPTAxisLabelingPolicyNone axisLabels:newAxisLabel];
    
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
    
    barChartView.getValueTipRectBlock = ^(CPTPlot *plot,NSInteger index,NSNumber *price){
        return CGRectMake(0, 0, 120, 40);
 
    };
    
    pieChartView2 = [[PieChartCPView alloc] init];
    pieChartView2.frame=CGRectMake(19,67, 482, 348);
    pieChartView2.graphTitle=@"Regional Returns";
    pieChartView2.delegate=self;
    pieChartView2.drawValueTipChartDelegate=self;
    pieChartView2.zoomDelegate=self;
   
    pieChartView2.parentView=self.view;
    
    pieChartView2.hostView.hostedGraph.fill=[CPTFill fillWithColor:[CPTColor clearColor]];
	pieChartView2.hostView.hostedGraph.plotAreaFrame.fill=[CPTFill fillWithColor:[CPTColor clearColor]];
    
    [pieChartView2 setNewPlotSource:[self generatePiePlotSource:0] withAnimation:YES];
    [pieChartView2 initChart];
    
    
    CPTGradient *overlayGradient = [[CPTGradient alloc] init];
	overlayGradient.gradientType = CPTGradientTypeRadial;
	overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.0] atPosition:0.9];
	overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.1] atPosition:0.95];
	overlayGradient = [overlayGradient addColorStop:[[CPTColor whiteColor] colorWithAlphaComponent:0.6] atPosition:1.5];
	((CPTPieChart *)[pieChartView2.plotArray objectAtIndex:0]).overlayFill = [CPTFill fillWithGradient:overlayGradient];

    
    [self.view addSubview:pieChartView2];
    
    pieChartView2.getValueTipRectBlock = ^(CPTPlot *plot,NSInteger index,NSNumber *price){
        return CGRectMake(0, 0, 120, 40);
    };

    chartArray = [[NSMutableArray alloc] initWithObjects:barChartView,pieChartView2, nil ];
    
    

}

- (void)viewDidUnload
{
    [self setDataTableView:nil];
    self.dataArray=nil;
    barChartView=nil;
    
    chartArray=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

-(NSMutableDictionary *)generateBarPlotSource:(NSInteger)index{
    NSMutableDictionary *dict= [[NSMutableDictionary alloc] initWithCapacity:2];
    
    
    
     
     NSMutableDictionary *plot1=[[NSMutableDictionary alloc] init];
    NSArray *data=[barAllData objectAtIndex:index];
    [plot1 setObject:data forKey:@"value"];
//    [plot1 setObject:[NSArray arrayWithObjects:[NSNumber numberWithDouble:100.0 * rand() / (double)RAND_MAX],[NSNumber numberWithDouble:100.0 * rand() / (double)RAND_MAX ],[NSNumber numberWithDouble:100.0 * rand() / (double)RAND_MAX], nil] forKey:@"value"];
//    NSMutableDictionary *plot2=[[NSMutableDictionary alloc] init];
//    [plot2 setObject:[NSArray arrayWithObjects:[NSNumber numberWithDouble:100.0 * rand() / (double)RAND_MAX ],[NSNumber numberWithDouble:100.0 * rand() / (double)RAND_MAX],[NSNumber numberWithDouble:100.0 * rand() / (double)RAND_MAX ], nil] forKey:@"value"];
    [dict setObject:plot1 forKey:@"A1"];
//    [dict setObject:plot2 forKey:@"A2"];
    return dict;
}

-(NSMutableDictionary *)generatePiePlotSource:(NSInteger)index{
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *plot1=[[NSMutableDictionary alloc] init];
//#if 1
////    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
////    
////    for(int i = 0; i < 4; i ++)
////    {
////        NSNumber *one = [NSNumber numberWithDouble:100.0 * rand() / (double)RAND_MAX];
////        [array addObject:one];
////    }
//#else
//    NSArray *array = [allData objectAtIndex:index];
//#endif
    NSArray *array = [allData objectAtIndex:index];
    [plot1 setObject:array forKey:@"value"];
    [dict setObject:plot1 forKey:@"pie"];
    
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
    static NSString *kCellIdentifier=@"TableChartViewCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kCellIdentifier];
	}
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
	cell.textLabel.text=[dataArray objectAtIndex:indexPath.row];
//     cell.detailTextLabel.text=[NSString stringWithFormat:@"Returns %.2f     Exposure %.2f       Capital Allocated %.2f        Capital Used %.2f",(10000.0 * rand() / (double)RAND_MAX),(10000.0 * rand() / (double)RAND_MAX),(10000.0 * rand() / (double)RAND_MAX),(10000.0 * rand() / (double)RAND_MAX)];
    
    NSArray *data=[allData objectAtIndex:indexPath.row];
    NSLog(@"...%@",[data objectAtIndex:0]);
     cell.detailTextLabel.text=[NSString stringWithFormat:@"Returns %@     Exposure %@       Province Allocated %@        Capital  %@",[data objectAtIndex:0],[data objectAtIndex:1],[data objectAtIndex:2],[data objectAtIndex:3]];
    
    
	return cell;
}

#pragma mark UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 //  [pieChartView setPlotSource:[self generatePiePlotSource]];
//    [pieChartView.pieChart reloadData];
//    [barChartView setNewPlotSource:[self generateBarPlotSource] withAnimation:YES];
    [pieChartView2 setNewPlotSource:[self generatePiePlotSource:indexPath.row] withAnimation:YES];
    

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
    
    NSString *name;
        if (view==barChartView) {
        name = [barNames objectAtIndex:index];
    }
    else {
        name = [names objectAtIndex:index];
    }
   
     
    
    NSString *text = [formatter stringFromNumber:price];
    NSLog(@"text=%@",text);
     
    
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
    [@"Name" drawInRect:CGRectInset(CGRectMake(5+rect.origin.x, 4+rect.origin.y, 100, 20),
                                 0,
                                 0)
       withTextStyle:style
           inContext:context];
    [@"Price" drawInRect:CGRectInset(CGRectMake(5+rect.origin.x, 22+rect.origin.y, 50, 20),
                                    0,
                                    0)
          withTextStyle:style
              inContext:context];
    [name drawInRect:CGRectInset(CGRectMake(15+rect.origin.x, 4+rect.origin.y, 100, 20),
                                    0,
                                    0)
          withTextStyle:style2
              inContext:context];
    [text drawInRect:CGRectInset(CGRectMake(48+rect.origin.x, 22+rect.origin.y, 60, 20),
                                     0,
                                     0)
           withTextStyle:style2
               inContext:context];
    
//    [text drawInRect:CGRectInset(rect,
//                                 ABS(shadowOffset.width) + shadowRadius + kCPTTextLayerMarginWidth,
//                                 ABS(shadowOffset.height) + shadowRadius + kCPTTextLayerMarginWidth)
//       withTextStyle:style
//           inContext:context];
   
     
    if (view == pieChartView2) {
        [barChartView setNewPlotSource:[self generateBarPlotSource:index] withAnimation:YES];

    }
}
-(CGRect)zoomChartRectInSuperView:(ChartCPBaseView *)view{
    if (view==barChartView) {
        return CGRectMake(20, 40, 950, 600);
    }
    if (view==pieChartView2) {
        return CGRectMake(20, 40, 950, 600);
    }
    return CGRectZero;
}

-(CPTLayer *)dataLabelForPlot:(id)plot recordIndex:(NSUInteger)index{
    static CPTMutableTextStyle *labelText = nil;
	if (!labelText) {
		labelText= [[CPTMutableTextStyle alloc] init];
		labelText.color = [CPTColor whiteColor];
	}
	// 2 - Calculate portfolio total value
    NSArray *itemArray = [[pieChartView2.plotSource objectForKey:@"pie"] objectForKey:@"value"];
	NSDecimalNumber *portfolioSum = [NSDecimalNumber zero];
	for (NSNumber *price in itemArray) {
        portfolioSum = [portfolioSum decimalNumberByAdding:[NSDecimalNumber decimalNumberWithDecimal:price.decimalValue]];
	}
	// 3 - Calculate percentage value
    NSNumber *priceNumber = [itemArray objectAtIndex:index];
	NSDecimalNumber *price = [NSDecimalNumber decimalNumberWithDecimal:priceNumber.decimalValue];
	NSDecimalNumber *percent = [price decimalNumberByDividingBy:portfolioSum];
	// 4 - Set up display label
    NSString *labelValue = [NSString stringWithFormat:@"%0.1f%%", ([percent floatValue]*100.0f)];
    
	// 5 - Create and return layer with label text
	return [[CPTTextLayer alloc] initWithText:labelValue style:labelText];
}

#pragma mark- DidSelectSliceChartDelegate
-(void)didSelectSliceAtIndex:(NSInteger)index price:(NSNumber *)price{
    
    NSLog(@"选取的个数%d",index);
//    [barChartView moveToFrame:CGRectMake(50, 50, 800, 600) animation:YES];
   // [barChartView setNewPlotSource:[self generateBarPlotSource] withAnimation:YES];

}

-(void)on_tap:(ChartCPBaseView *)view sender:(UITapGestureRecognizer *)sender{
    
    for (ChartCPBaseView *cview in chartArray) {
        cview.isSelected=NO;
    }
//    pieChartView2.isSelected=NO;
//    barChartView.isSelected=NO;
}

#pragma mark - ZoomTipDelegate
-(UIView *)createTipView:(ChartCPBaseView *)view{
    
    UIView *view2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 230, 50)];
    view2.backgroundColor=[UIColor clearColor];
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(5, 5, 80, 20)];
    lbl.font=[UIFont systemFontOfSize:13];
    lbl.text=@"Name";
    lbl.tag=1;
    lbl.backgroundColor = [UIColor clearColor];
    [view2 addSubview:lbl];
    lbl=[[UILabel alloc] initWithFrame:CGRectMake(55, 5, 80, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.font=[UIFont systemFontOfSize:13];
    lbl.tag=2;
    [view2 addSubview:lbl];
    lbl=[[UILabel alloc] initWithFrame:CGRectMake(5, 25, 80, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.font=[UIFont systemFontOfSize:13];
    lbl.text=@"Price";
    lbl.tag=3;
    [view2 addSubview:lbl];
    lbl=[[UILabel alloc] initWithFrame:CGRectMake(55, 25, 80, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.font=[UIFont systemFontOfSize:13];
    lbl.tag=4;
    [view2 addSubview:lbl];
    return view2;

}
-(CGRect)resetTipSize:(ChartCPBaseView *)view tipView:(UIView *)tipView{
    return CGRectMake(0, 0, 230, 50);
}
-(void)relayoutTipView:(ChartCPBaseView *)view tipView:(UIView *)tipView mode:(UITipViewMaskMode)maskMode{
    UILabel *lbl1=(UILabel *)[tipView viewWithTag:1];
    UILabel *lbl2=(UILabel *)[tipView viewWithTag:2];
    UILabel *lbl3=(UILabel *)[tipView viewWithTag:3];
    UILabel *lbl4=(UILabel *)[tipView viewWithTag:4];

  //  UILabel *lbl=(UILabel *)[tipView viewWithTag:2];
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

//    NSString *name = [dataArray objectAtIndex:view.selectIndex];
//    lbl.text=name;
//    NSString *text = [formatter stringFromNumber:view.selectPrice];
//    lbl=(UILabel *)[tipView viewWithTag:4];
//    lbl.text=text;
    NSString *name = [barNames objectAtIndex:view.selectIndex];
    lbl2.text=name;
    NSString *text = [formatter stringFromNumber:view.selectPrice];
    lbl4.text=text;

    
}

@end
