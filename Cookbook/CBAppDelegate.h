//
//  CBAppDelegate.h
//  Cookbook
//
//  Created by yu xin on 12-11-28.
//  Copyright (c) 2012年 yuxin2018@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Crashlytics/Crashlytics.h>

@class MainViewController;
@class IIViewDeckController;

@interface CBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) UIViewController *centerController;
@property (retain, nonatomic) UIViewController *leftController;

- (IIViewDeckController*)generateControllerStack;

@end
