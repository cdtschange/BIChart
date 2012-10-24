//
//  BarHorizontalViewController.m
//  BIChart
//
//  Created by Wei Mao on 10/24/12.
//  Copyright (c) 2012 Wei Mao. All rights reserved.
//

#import "BarHorizontalViewController.h"

@interface BarHorizontalViewController ()

@end

@implementation BarHorizontalViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


@end
