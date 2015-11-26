//
//  CalendarViewLayout.m
//  CalendarView
//
//  Created by hupeng on 15/3/24.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "CalendarViewLayout.h"
#import "CalendarHeaderView.h"
#import "CalendarViewCell.h"
#import "UIView+ViewKit.h"

@implementation CalendarViewLayout

- (void)awakeFromNib
{
    CGSize itemSize = [CalendarViewCell loadNibForCurrentDevice].frame.size;
    float offset = (CGRectGetWidth([UIScreen mainScreen].bounds) - 7 * itemSize.width)/2;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.itemSize = itemSize;
    self.sectionInset = UIEdgeInsetsMake(0, offset, 0, offset);
    self.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.bounds), HP_CALENDAR_VIEW_HEADER_HEIGTH);
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGPoint targetPoint = proposedContentOffset;
    
    CGFloat minDiffer = proposedContentOffset.y;
    
    
    for (int i = 0; i < self.collectionView.numberOfSections; i++) {
        
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:i]];
        
        if (fabs(CGRectGetMinY(attrs.frame) - proposedContentOffset.y) < minDiffer) {
            minDiffer = fabs(CGRectGetMinY(attrs.frame) - proposedContentOffset.y);
            targetPoint.y = CGRectGetMinY(attrs.frame);
        }
    }
    return targetPoint;
}

@end
