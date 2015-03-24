//
//  CalendarViewCell.m
//  CalendarView
//
//  Created by hupeng on 15/3/24.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "CalendarViewCell.h"

@implementation CalendarViewCell


- (void)setIsCurrentDay:(BOOL)isCurrentDay
{
    _isCurrentDay = isCurrentDay;
    
    _label.layer.cornerRadius = isCurrentDay ? CGRectGetWidth(_label.frame) * 0.5 : 0;
    _label.clipsToBounds = TRUE;
    _label.backgroundColor = isCurrentDay ? [UIColor redColor] : [UIColor clearColor];
}

- (void)setIsCurrentMonth:(BOOL)isCurrentMonth
{
    _isCurrentMonth = isCurrentMonth;
    _label.textColor = isCurrentMonth ? [UIColor blackColor] : [UIColor lightGrayColor];
}
@end
