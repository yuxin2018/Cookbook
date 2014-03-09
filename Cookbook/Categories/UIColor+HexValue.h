//
//  UIColor+HexValue.h
//  Cookbook
//
//  Created by yuxin on 14-3-9.
//  Copyright (c) 2014年 yuxin2018@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexValue)

+ (id)colorWithHexValue:(NSUInteger)hexValue alpha:(NSUInteger)alpha;

+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue;

@end
