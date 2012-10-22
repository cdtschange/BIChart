//
//  HelpViewController.m
//  BIChart
//
//  Created by zouzhisheng on 12-9-29.
//  Copyright (c) 2012年 Wei Mao. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

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
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.hidesBackButton=YES;
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame=CGRectMake(0, 0, 64, 44);
    
    [bt setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    
    [bt addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithCustomView:bt];
    self.navigationItem.leftBarButtonItem=backItem;

}
-(void)onBack{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
