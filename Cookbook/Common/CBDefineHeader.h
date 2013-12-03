//
//  CBDefineHeader.h
//  Cookbook
//
//  Created by yu xin on 13-6-18.
//  Copyright (c) 2013年 yuxin2018@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kNAVIGATIONBAR_HEIGHT     44
#define kSCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)
#define kSCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
    
#define kSystemVersion           ([[UIDevice currentDevice] systemVersion])
#define kLocalLanguage           ([[NSLocale preferredLanguages] objectAtIndex:0])

#define kAppVersion              [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define kAppVersionDevelopment   [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define kAppDisplayName          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

#define kCachesFolder            [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"]
#define kDocumentsFolder         [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define kAppDelegate             ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define kBlockBack(block)        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define kBlockMain(block)        dispatch_async(dispatch_get_main_queue(),block)

#define isPad                    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isRetina                 [[UIScreen mainScreen] scale] == 2
#define isiPhone5                ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define LOADIMAGE(file,ext)       [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
#define VIEWWITHTAG(_OBJECT, _TAG)    [_OBJECT viewWithTag : _TAG]

#define kCOLORRGB(r,g,b)          [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1] 
#define kCOLORRGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)] 

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kDegreesToRadian(degrees) (M_PI * (degrees) / 180.0)
#define kRadianToDegrees(radian)  (radian * 180.0)/(M_PI)

#define _po(o) DLOG(@"%@", (o))
#define _pn(o) DLOG(@"%d", (o))
#define _pf(o) DLOG(@"%f", (o))
#define _ps(o) DLOG(@"CGSize: {%.0f, %.0f}", (o).width, (o).height)
#define _pr(o) DLOG(@"NSRect: {{%.0f, %.0f}, {%.0f, %.0f}}", (o).origin.x, (o).origin.x, (o).size.width, (o).size.height)

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
//ToDo...
#endif

#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


#ifdef DEBUG
#   define NSLog(...) NSLog(__VA_ARGS__)
#else
#   define NSLog(...) {}
#endif


#if __has_feature(objc_arc)
//ARC
#else
//NOT ARC
#endif

@interface CBDefineHeader : NSObject

@end
