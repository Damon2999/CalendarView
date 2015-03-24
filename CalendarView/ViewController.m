//
//  ViewController.m
//  CalendarView
//
//  Created by hupeng on 15/3/23.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "ViewController.h"
#import "CalendarView.h"
#import "UIView+ViewKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CalendarView *view = [CalendarView loadNibForCurrentDevice];
    view.center = self.view.center;
    [self.view addSubview:view];
}


@end
