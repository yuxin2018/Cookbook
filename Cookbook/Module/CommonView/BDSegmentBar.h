//
//  BDSegmentBar.h
//  VideoIphone
//
//  Created by yuxin04 on 14-1-14.
//  Copyright (c) 2014年 com.baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDSegmentBar;

@protocol BDSegmentBarDelegate <NSObject>

/**
 * Tab点击回调
 *
 * @param selectedIndex 选中的Tab序号
 * @param selectedTitle 选中的Tab标题
 *
 */

- (void)segmentBarBar:(BDSegmentBar *)segmentBar selectedIndex:(int)index selectedTitle:(NSString *)title;

@end

@interface BDSegmentBar : UIView
{
    __weak id delegateBar;
    int currentIndex;
}

@property (nonatomic,weak) id delegateBar;
@property (nonatomic,assign,readonly) int currentIndex;

//初始化数据，Array格式为：@["按更新","按热门","按排序"]
- (void)updateWithTitleArray:(NSArray *)array;

//根据序号跳到指定项
- (void)goSegmentWithIndex:(int)index;

//根据标题跳到指定项
- (void)goSegmentWithTitle:(NSString *)title;

//根据序号跳到指定项 不促发点击事件
- (void)goSegmentByNoActionWithIndex:(int)index;

@end
