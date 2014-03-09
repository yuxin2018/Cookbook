//
//  BDSegmentBar.m
//  VideoIphone
//
//  Created by yuxin04 on 14-1-14.
//  Copyright (c) 2014年 com.baidu. All rights reserved.
//

#import "BDSegmentBar.h"
#import "CategoriesHeader.h"
#import <QuartzCore/QuartzCore.h>

#define kButtonTagOffset 22345

@interface BDSegmentBar()
{
    NSArray *arrayTitle;
}

@property (nonatomic,strong) NSArray *arrayTitle;

@end


@implementation BDSegmentBar
@synthesize arrayTitle;
@synthesize currentIndex;
@synthesize delegateBar;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViewStyle];
    }
    return self;
}

- (void)initViewStyle
{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 3.0;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithHexValue:0X298efd].CGColor;
}

- (UIButton *)btnSubTabWithFrame:(CGRect)rect title:(NSString *)title
{
    UIButton *btnItem = [[UIButton alloc]initWithFrame:rect];
    [btnItem setTitle:title forState:UIControlStateNormal];
    btnItem.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnItem setBackgroundColor:[UIColor clearColor]];
    
    [btnItem setTitleColor:[UIColor colorWithHexValue:0x323546] forState:UIControlStateNormal];
    [btnItem setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btnItem setBackgroundImage:[self createImageWithColor:[UIColor colorWithHexValue:0X298efd]] forState:UIControlStateSelected];
    btnItem.layer.borderWidth = 0.5;
    btnItem.layer.borderColor = [UIColor colorWithHexValue:0X298efd].CGColor;

    return btnItem;
}

- (void)updateWithTitleArray:(NSArray *)array
{
    arrayTitle = [NSArray arrayWithArray:array];
    for(int i = 0 ; i < arrayTitle.count; i++)
    {
        @autoreleasepool{
            NSString *title = [arrayTitle objectAtIndex:i];
            UIButton *btnItem = [self btnSubTabWithFrame:CGRectMake(i*CGRectGetWidth(self.frame)/arrayTitle.count, 0, CGRectGetWidth(self.frame)/arrayTitle.count, CGRectGetHeight(self.frame)) title:title];
            btnItem.tag = i + kButtonTagOffset;
            [btnItem setBackgroundImage:nil forState:UIControlStateNormal];
            [btnItem addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            if(currentIndex==i){
                btnItem.selected = YES;
            }
            
            [self addSubview:btnItem];
        }
    }
    
    [self setNeedsDisplay];
}

-(void) buttonAction:(id) sender
{
    UIButton *button = (UIButton*) sender;
    
    for(int i = 0; i < arrayTitle.count; i++)
    {
        UIButton *btnItem = (UIButton*) [self viewWithTag:i + kButtonTagOffset];
        if(btnItem.tag == button.tag)
        {
            btnItem.selected = YES;
            currentIndex = i;
        }
        else{
            btnItem.selected = NO;
        }
    }
    
    if(self.delegateBar && [self.delegateBar respondsToSelector:@selector(segmentBarBar:selectedIndex:selectedTitle:)]){
        [self.delegateBar segmentBarBar:self selectedIndex:button.tag - kButtonTagOffset selectedTitle:button.titleLabel.text];
    }
}

- (void)goSegmentWithTitle:(NSString *)title
{
    for(int i = 0; i < arrayTitle.count; i++)
    {
        UIButton *btnItem = (UIButton*) [self viewWithTag:i + kButtonTagOffset];
        if([btnItem.currentTitle isEqualToString:title])
        {
            btnItem.selected = YES;
            currentIndex = i;
        }
        else{
            btnItem.selected = NO;
        }
    }
    
    if(self.delegateBar && [self.delegateBar respondsToSelector:@selector(segmentBarBar:selectedIndex:selectedTitle:)]){
        [self.delegateBar segmentBarBar:self selectedIndex:currentIndex selectedTitle:title];
    }
}

- (void)goSegmentWithIndex:(int)index
{
    if(index >= arrayTitle.count)return ;
    NSString *title = [arrayTitle objectAtIndex:index];
    [self  goSegmentWithTitle:title];
}

- (void)goSegmentByNoActionWithIndex:(int)index;
{
    if(index >= arrayTitle.count)return ;
    NSString *title = [arrayTitle objectAtIndex:index];

    for(int i = 0; i < arrayTitle.count; i++)
    {
        UIButton *btnItem = (UIButton*) [self viewWithTag:i + kButtonTagOffset];
        if([btnItem.currentTitle isEqualToString:title])
        {
            btnItem.selected = YES;
            currentIndex = i;
        }
        else{
            btnItem.selected = NO;
        }
    }
}

- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0, 0, 1, 1);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)dealloc
{
    self.delegateBar = nil;
}


@end






