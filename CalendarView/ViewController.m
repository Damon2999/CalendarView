//
//  ViewController.m
//  CalendarView
//
//  Created by hupeng on 15/3/23.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+CalExt.h"

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *label;
@end

@implementation CollectionViewCell



@end



@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    int _currentMonthIndex;
    HPMonth *_currentMonth;

}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self monthChanged:_slider];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)monthChanged:(UISlider *)sender
{
    _currentMonthIndex = sender.value;
    _currentMonth = [HPMonth monthAtIndex:_currentMonthIndex];
    [_collectionView reloadData];
    _monthLabel.text = @(_currentMonthIndex).stringValue;
}



#pragma mark - UICollectionViewDataSource and UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _currentMonth.fullLength;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.label.text = _currentMonth.fullDays[indexPath.row];
    
    return cell;

}

@end
