//
//  NSDate+CalExt.m
//  CalendarView
//
//  Created by 胡鹏 on 15/3/21.
//  Copyright (c) 2015年 胡鹏. All rights reserved.
//

#import "NSDate+CalExt.h"

@implementation HPMonth

- (NSInteger)fullLength
{
    NSInteger fullLength = self.length;
    fullLength += (self.startWeekDay - 1);
    fullLength += (7 - self.endWeekDay);
    return fullLength;
}
- (NSArray *)fullDays
{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:self.fullLength];
    NSInteger preOffset = self.startWeekDay - 1;
    NSInteger sufOffset = 7 - self.endWeekDay;
    
    for (NSInteger i = preOffset; i > 0; i--) {
        NSInteger arrIndex = preOffset - i;
//        arr[arrIndex] = @(self.preMonthLength - i + 1).stringValue;
        arr[arrIndex] = @"";
    }
    
    for (NSInteger i = 0 ; i < self.length; i++) {
        NSInteger arrIndex = preOffset + i;
        arr[arrIndex] = @(i + 1).stringValue;
    }
    
    for (NSInteger i = 0 ; i < sufOffset; i++) {
        NSInteger arrIndex = preOffset + self.length + i;
//        arr[arrIndex] = @(i + 1).stringValue;
        arr[arrIndex] = @"";
    }
    
    return [NSArray arrayWithArray:arr];
}

+ (HPMonth *)monthAtIndex:(NSInteger)monthIndex
{
    NSInteger currentYear = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate new]];
    return  [HPMonth monthAtIndex:monthIndex ofYear:currentYear];
}

+ (HPMonth *)monthAtIndex:(NSInteger)monthIndex ofYear:(NSInteger)year
{
    NSArray *leapMonthLength = @[@(31),@(29),@(31),@(30),@(31),@(30),@(31),@(31),@(30),@(31),@(30),@(31)];
    NSArray *normalMonthLength = @[@(31),@(28),@(31),@(30),@(31),@(30),@(31),@(31),@(30),@(31),@(30),@(31)];

    NSString *monthString = [NSString stringWithFormat:@"%d-%@%d-01", (int)year, monthIndex > 9 ? @"" : @"0" , (int)monthIndex];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *monthDate = [formatter dateFromString:monthString];
    
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:(NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth) fromDate:monthDate];
    
    NSInteger currentDay = comps.day;
    NSInteger currentWeekDay = comps.weekday;
    NSInteger currentMonth = comps.month;
    NSInteger preMonth = comps.month - 1 > 0 ? (comps.month - 1) : 12;
    
    NSInteger monthLength = [([[NSDate new] isLeapYear] ? leapMonthLength[currentMonth - 1] : normalMonthLength [currentMonth - 1]) integerValue];
    
    NSInteger startWeekIndex = currentWeekDay - ((currentDay - 1)%7);
    startWeekIndex = startWeekIndex <= 0 ? startWeekIndex + 7 : startWeekIndex;
    
    NSInteger endWeekIndex = currentWeekDay + ((monthLength - currentDay)%7);
    endWeekIndex = endWeekIndex > 7 ? endWeekIndex - 7 : endWeekIndex;
    
    HPMonth *month = [[HPMonth alloc] init];
    month.length = monthLength;
    month.startWeekDay = startWeekIndex;
    month.endWeekDay = endWeekIndex;
    month.preMonthLength = [([[NSDate new] isLeapYear] ? leapMonthLength[preMonth - 1] : normalMonthLength [preMonth - 1]) integerValue];
    return month;
}
@end

@implementation NSDate (CalExt)

+ (NSInteger)currentWeekDay
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitWeekday fromDate:[NSDate new]];
}

+ (HPMonth *)currentMonth
{
    NSInteger month = [[NSCalendar currentCalendar] component:NSCalendarUnitMonth fromDate:[NSDate new]];
    
    return [HPMonth monthAtIndex:month];
}

+ (NSInteger)currentDay
{
    return [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[NSDate new]];
}

- (BOOL)isLeapYear
{
    
    NSInteger year = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate:[NSDate new]];
    
    BOOL isLeap = FALSE;
    
    isLeap = (year%4 == 0 && year%100 != 0) | (year%400 == 0);

    return isLeap;
}
@end
