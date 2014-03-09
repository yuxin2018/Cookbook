//
//  UIColor+HexValue.m
//  Cookbook
//
//  Created by yuxin on 14-3-9.
//  Copyright (c) 2014年 yuxin2018@gmail.com. All rights reserved.
//

#import "UIColor+HexValue.h"

@implementation UIColor(HexValue)

+ (id)colorWithHexValue:(NSUInteger)hexValue alpha:(NSUInteger)alpha
{
    CGFloat r = ((hexValue & 0x00FF0000) >> 16) / 255.0;
    CGFloat g = ((hexValue & 0x0000FF00) >> 8) / 255.0;
    CGFloat b = (hexValue & 0x000000FF) / 255.0;
    CGFloat a = alpha / 255.0;
    
    return [self colorWithRed:r green:g blue:b alpha:a];
}

+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue
{
    return [self colorWithHexValue:hexValue alpha:255];
}

@end
