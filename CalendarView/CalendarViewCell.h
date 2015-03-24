//
//  CalendarViewCell.h
//  CalendarView
//
//  Created by hupeng on 15/3/24.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewCell : UICollectionViewCell

@property (nonatomic, assign) BOOL isCurrentMonth;
@property (nonatomic, assign) BOOL isCurrentDay;
@property (nonatomic, weak) IBOutlet UILabel *label;

@end
