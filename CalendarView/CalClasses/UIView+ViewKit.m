//
//  UIView+ImageViewGenerator.m
//  snapgrab
//
//  Created by hupeng on 14-6-24.
//  Copyright (c) 2014年 Hu Peng. All rights reserved.
//

#import "UIView+ViewKit.h"

@implementation UIView (ViewKit)

- (UIImage *)viewShot
{
    float scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+ (instancetype)loadNibForCurrentDevice
{
    NSString *nibName = NSStringFromClass([self class]);
    
    int width = CGRectGetWidth([UIScreen mainScreen].bounds);
    int height = CGRectGetHeight([UIScreen mainScreen].bounds);
    
    NSString *preferNibName = [NSString stringWithFormat:@"%@_%d_%d", nibName, width, height];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:preferNibName ofType:@"nib"];

    if (filePath) {
        nibName = preferNibName;
    } else {
        preferNibName = [NSString stringWithFormat:@"%@_%d", nibName, width];
        filePath = [[NSBundle mainBundle] pathForResource:preferNibName ofType:@"nib"];
        
        if (filePath) {
            nibName = preferNibName;
        }
    }
    return [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil][0];
}
@end