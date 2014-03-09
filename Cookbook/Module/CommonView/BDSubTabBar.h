//
//  BDSubTabBar.h
//  VideoIphone
//
//  Created by yuxin04 on 14-1-13.
//  Copyright (c) 2014年 com.baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDSubTabBar;

@protocol BDSubTabBarDelegate <NSObject>

/**
 * Tab点击回调
 *
 * @param selectedIndex 选中的Tab序号
 * @param selectedTitle 选中的Tab标题
 *
 */

- (void)subTabBar:(BDSubTabBar *)subTabBar selectedIndex:(int)index selectedTitle:(NSString *)title;

@end

@interface BDSubTabBar : UIView
{
    __weak id delegateBar;
    int currentIndex;
    BOOL isValidWithDuplicateClick;  //再次点击同一Tab时，点击是否有效
}

@property (nonatomic,weak) id delegateBar;
@property (nonatomic,assign,readonly) int currentIndex;
@property (nonatomic,assign) BOOL isValidWithDuplicateClick;

//初始化数据，Array格式为：@["精选","全选","部分"]
- (void)updateWithTitleArray:(NSArray *)array;

//根据序号跳到指定Tab
- (void)goSubTabWithIndex:(int)index;

//根据标题跳到指定
- (void)goSubTabWithTitle:(NSString *)title;

@end
