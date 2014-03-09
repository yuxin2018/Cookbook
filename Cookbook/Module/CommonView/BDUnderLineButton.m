//
//  BDUnderLineButton.m
//  VideoIphone
//
//  Created by yuxin04 on 13-11-26.
//  Copyright (c) 2013年 com.baidu. All rights reserved.
//

#import "BDUnderLineButton.h"
#import "CategoriesHeader.h"

@implementation BDUnderLineButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.highlightedTextColor = [UIColor colorWithHexValue:0X298efd];
        [self setTitleColor:[UIColor colorWithHexValue:0X6f7281] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithHexValue:0X298efd] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor colorWithHexValue:0X298efd] forState:UIControlStateHighlighted];
        [self setBackgroundColor:[UIColor clearColor]];

    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    CGRect textRect = self.titleLabel.frame;
    CGFloat descender = self.titleLabel.font.descender + 8;
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    if(self.isSelected){
        CGContextSetStrokeColorWithColor(contextRef, self.titleLabel.highlightedTextColor.CGColor);
    }
    else{
        CGContextSetStrokeColorWithColor(contextRef,[UIColor clearColor].CGColor);
    }
    
    CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y + textRect.size.height + descender);
    CGContextAddLineToPoint(contextRef, textRect.origin.x + textRect.size.width, textRect.origin.y + textRect.size.height + descender);
    CGContextSetLineWidth(contextRef,2);

    CGContextClosePath(contextRef);
    CGContextDrawPath(contextRef, kCGPathStroke); 
}

@end
