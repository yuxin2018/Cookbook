//
//  CBCustomCell.m
//  Cookbook
//
//  Created by yu xin on 13-1-14.
//  Copyright (c) 2013年 yuxin2018@gmail.com. All rights reserved.
//

#import "CBCustomCell.h"

@implementation CBCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);

    //底部分割线
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineCap(context, kCGLineCapSquare);
	CGContextSetLineWidth(context, 0.5);
	CGContextSetRGBStrokeColor(context, 0.7, 0.7, 0.7, 1.0);
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 0, rect.size.height-0.5);
	CGContextAddLineToPoint(context, rect.size.width, rect.size.height-0.5);
	CGContextStrokePath(context);
    
    
    
    CGContextRestoreGState(ctx);
}

@end
