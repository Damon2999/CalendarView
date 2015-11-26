//
//  CalendarHeaderView.h
//  CalendarView
//
//  Created by hupeng on 15/3/24.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HP_CALENDAR_VIEW_HEADER_HEIGTH 30

@interface CalendarHeaderView : UICollectionReusableView

@property (nonatomic, assign) BOOL isCurrentMonth;
@property (nonatomic, weak) IBOutlet UILabel *label;

@end

