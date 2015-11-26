//
//  CalendarHeaderView.m
//  CalendarView
//
//  Created by hupeng on 15/3/24.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "CalendarHeaderView.h"

@implementation CalendarHeaderView

- (void)setIsCurrentMonth:(BOOL)isCurrentMonth
{
    _isCurrentMonth = isCurrentMonth;
    _label.textColor = isCurrentMonth ? [UIColor blackColor] : [UIColor lightGrayColor];
}

@end
