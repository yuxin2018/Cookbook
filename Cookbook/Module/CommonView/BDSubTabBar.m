//
//  BDSubTabBar.m
//  VideoIphone
//
//  Created by yuxin04 on 14-1-13.
//  Copyright (c) 2014年 com.baidu. All rights reserved.
//

#import "BDSubTabBar.h"
#import "CategoriesHeader.h"

#define kButtonTagOffset 12345
#define ButtonMargin 15
#define ButtonPadding 20
#define ButtonHeight 44

@interface BDSubTabBar()
{
    UIImageView *ivUnderLine;
    NSArray *arrayTitle;
}

@property (nonatomic,strong) NSArray *arrayTitle;

@end

@implementation BDSubTabBar
@synthesize delegateBar;
@synthesize arrayTitle;
@synthesize currentIndex;
@synthesize isValidWithDuplicateClick;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        arrayTitle =  [[NSArray alloc]init];
        currentIndex = 0;
        isValidWithDuplicateClick = YES;
        [self addBackgroundUnderLine];
    }
    return self;
}

- (void)addBackgroundUnderLine
{
    UIImageView *ivBackgroundUnderLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-0.5, CGRectGetWidth(self.frame), 0.5)];
    [ivBackgroundUnderLine setImage:[self createImageWithColor:[UIColor lightGrayColor]]];
    [self addSubview:ivBackgroundUnderLine];
}

- (UIButton *)btnSubTabWithFrame:(CGRect)rect title:(NSString *)title
{
    UIButton *btnItem = [[UIButton alloc]initWithFrame:rect];
    [btnItem setTitle:title forState:UIControlStateNormal];
    btnItem.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnItem setTitleColor:[UIColor colorWithHexValue:0X2c2e36] forState:UIControlStateNormal];
    [btnItem setTitleColor:[UIColor colorWithHexValue:0X298efd] forState:UIControlStateSelected];
    [btnItem setBackgroundColor:[UIColor clearColor]];
    
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
                
                ivUnderLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-1.0, CGRectGetWidth(btnItem.frame), 1.5)];
                [ivUnderLine setImage:[self createImageWithColor:[UIColor colorWithHexValue:0X298efd]]];
                ivUnderLine.center = CGPointMake(btnItem.center.x,CGRectGetHeight(self.frame) - 1.0);
                [self addSubview:ivUnderLine];
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
            
            [UIView animateWithDuration:0.2
                             animations:^
             {
                 CGPoint center = ivUnderLine.center;
                 center.x = btnItem.center.x;
                 ivUnderLine.center = center;
             }];
            
        }
        else{
            btnItem.selected = NO;
        }
    }
    
    if(self.delegateBar && [self.delegateBar respondsToSelector:@selector(subTabBar:selectedIndex:selectedTitle:)]){
        [self.delegateBar subTabBar:self selectedIndex:button.tag - kButtonTagOffset selectedTitle:button.titleLabel.text];
    }
}

- (void)goSubTabWithTitle:(NSString *)title
{
    NSString *currentTitle = [arrayTitle objectAtIndex:currentIndex];
    if([currentTitle isEqualToString:title]  && !isValidWithDuplicateClick)return;

    for(int i = 0; i < arrayTitle.count; i++)
    {
        UIButton *btnItem = (UIButton*) [self viewWithTag:i + kButtonTagOffset];
        if([btnItem.currentTitle isEqualToString:title])
        {
            btnItem.selected = YES;
            currentIndex = i;
            
            [UIView animateWithDuration:0.2
                             animations:^
             {
                 CGPoint center = ivUnderLine.center;
                 center.x = btnItem.center.x;
                 ivUnderLine.center = center;
             }];
        }
        else{
            btnItem.selected = NO;
        }
    }
    
    if(self.delegateBar && [self.delegateBar respondsToSelector:@selector(subTabBar:selectedIndex:selectedTitle:)]){
        [self.delegateBar subTabBar:self selectedIndex:currentIndex selectedTitle:title];
    }
}

- (void)goSubTabWithIndex:(int)index
{
    if(index >= arrayTitle.count)return ;
    if(index == currentIndex && !isValidWithDuplicateClick)return;
    
    NSString *title = [arrayTitle objectAtIndex:index];
    [self  goSubTabWithTitle:title];
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
