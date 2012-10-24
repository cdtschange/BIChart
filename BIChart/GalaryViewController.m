//
//  GalaryViewController.m
//  BIChart
//
//  Created by Wei Mao on 10/24/12.
//  Copyright (c) 2012 Wei Mao. All rights reserved.
//

#import "GalaryViewController.h"

@interface GalaryViewController ()
{
    NSDictionary *itemDictSource;
    NSArray *itemSectionSource;
    NSString *selectSegue;
}

@end

@implementation GalaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initSource];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSource{
    itemSectionSource = @[@"Pie",@"Bar",@"Scatter"];
    itemDictSource = @{@"Pie":@[@"PieBase"],@"Bar":@[@"BarBase",@"BarHorizontal"],@"Scatter":@[@"ScatterBase"]};
}


- (IBAction)click_GoIn:(id)sender {
    [self performSegueWithIdentifier:[NSString stringWithFormat:@"GoTo%@",selectSegue] sender:sender];
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationLandscapeRight;
}
-(BOOL)shouldAutorotate{
    return YES;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)itemDictSource[itemSectionSource[section]]).count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return itemSectionSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kTableViewCellIdentify = @"GalaryTableViewCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentify];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kTableViewCellIdentify];
	}
    
    cell.textLabel.text=((NSArray *)itemDictSource[itemSectionSource[indexPath.section]])[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectSegue = itemDictSource[itemSectionSource[indexPath.section]][indexPath.row];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return itemSectionSource[section];
}



@end
