//
//  UIView+ImageViewGenerator.h
//  snapgrab
//
//  Created by hupeng on 14-6-24.
//  Copyright (c) 2014年 Hu Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewKit)

- (UIImage *)viewShot;

+ (instancetype)loadNibForCurrentDevice;

@end
