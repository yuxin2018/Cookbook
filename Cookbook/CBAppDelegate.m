//
//  CBAppDelegate.m
//  Cookbook
//
//  Created by yu xin on 12-11-28.
//  Copyright (c) 2012年 yuxin2018@gmail.com. All rights reserved.
//

#import "CBAppDelegate.h"
#import "CBCommon.h"
#import "IIViewDeckController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "MainViewController.h"

@implementation CBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [CBCommon deviceString];
    IIViewDeckController* deckController = [self generateControllerStack];
    self.leftController = deckController.leftController;
    self.centerController = deckController.centerController;
    
    deckController.openSlideAnimationDuration = 0.15f;
    deckController.closeSlideAnimationDuration = 0.5f;
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = deckController;
    [self.window makeKeyAndVisible];
    
    [Crashlytics startWithAPIKey:@"5d9825bc0a809ef8f20c33fa4ce1b7466161031d"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (IIViewDeckController*)generateControllerStack {
    LeftViewController* leftController = [[LeftViewController alloc] init];
    RightViewController* rightController = [[RightViewController alloc] init];
    
    UIViewController *centerController = [[MainViewController alloc] init];
    centerController = [[UINavigationController alloc] initWithRootViewController:centerController];
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:centerController
                                                                                    leftViewController:leftController
                                                                                   rightViewController:rightController];
    deckController.rightSize = 100;
    
    [deckController disablePanOverViewsOfClass:NSClassFromString(@"_UITableViewHeaderFooterContentView")];
    return deckController;
}

@end
