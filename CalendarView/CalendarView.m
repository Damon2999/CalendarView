//
//  CalendarView.m
//  CalendarView
//
//  Created by hupeng on 15/3/24.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "CalendarView.h"
#import "CalendarViewCell.h"
#import "CalendarHeaderView.h"
#import "NSDate+CalExt.h"
#import "UINib+NibExt.h"

@interface CalendarView ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSInteger _currentDay;
    NSInteger _currentMonth;
    NSMutableArray *_dataSource;
}

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation CalendarView

- (void)awakeFromNib
{
    _dataSource = @[].mutableCopy;
    
    for (int i = 0; i < 12; i++) {
        HPMonth *month = [HPMonth monthAtIndex:i + 1];
        [_dataSource addObject:month];
    }
    
    [_collectionView registerNib:[UINib loadNib:@"CalendarViewCell"] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerNib:[UINib loadNib:@"CalendarHeaderView"] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    _currentDay   = [NSDate currentDay];
    _currentMonth = [NSDate currentMonth];
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    UICollectionViewLayoutAttributes *attrs = [_collectionView layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:_currentMonth - 1]];
    
    _collectionView.contentOffset = CGPointMake(_collectionView.contentOffset.x, CGRectGetMinY(attrs.frame) - HP_CALENDAR_VIEW_HEADER_HEIGTH);
    
}


#pragma mark - UICollectionViewDataSource and UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataSource.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    HPMonth *month = _dataSource[section];
    return month.fullLength;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    HPMonth *month = _dataSource[indexPath.section];
    NSString *text = month.fullDays[indexPath.row];
    
    cell.label.text     = text;
    cell.isCurrentMonth = month.month == _currentMonth;
    cell.isCurrentDay   = (text.integerValue == _currentDay) && cell.isCurrentMonth;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

    HPMonth *month = _dataSource[indexPath.section];
    
    CalendarHeaderView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    
    reusableView.label.text = @(indexPath.section + 1).stringValue;
    reusableView.isCurrentMonth = month.month == _currentMonth;
    
    return reusableView;
}
@end
