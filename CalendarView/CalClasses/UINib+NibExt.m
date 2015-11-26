//
//  UINib+NibExt.m
//  CalendarView
//
//  Created by hupeng on 15/3/24.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "UINib+NibExt.h"

@implementation UINib (NibExt)

+ (UINib *)loadNib:(NSString *)nibName
{
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
    
    return [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
}
@end
