//
//  CBCommon.h
//  Cookbook
//
//  Created by yu xin on 12-11-28.
//  Copyright (c) 2012年 yuxin2018@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sys/utsname.h"


@interface CBCommon : NSObject

//判断iOS设备型号
+ (NSString *)deviceString;

//计算距离1970.1.1 毫秒数
+(long long)milliSecondsSince1970WithDate:(NSDate *)date;

// 根据内容 宽度 字体大小  动态计算内容区域大小
+ (CGSize)sizeWithContent:(NSString *)stringTemp width:(float)width fontSize:(float)fontSize;

//是否是纯整型
+ (BOOL)isPureInt:(NSString*)string;

//是否是纯浮点数
+ (BOOL)isPureFloat:(NSString*)string;

//字符串是否是邮箱格式
+ (BOOL)isValidEmail: (NSString *) email;

//在Library/Cache目录下创建文件,并返回文件路径
+ (NSString *)createFileAtCacheWithDirectoryName:(NSString *)directoryName;

//在Documents目录下创建文件,并返回文件路径
+ (NSString *)createFileAtDocumentWithDirectoryName:(NSString *)directoryName;

//正常以下特殊符号不会被转义  现强转  From:ASIHTTPRequest
+ (NSString *)encodeURL:(NSString *)string;

//正常以下特殊符号不会被转义  现强转  From:MKNetworkKit
+ (NSString*) urlEncodedString:(NSString *)string;

//与urlEncodedString对应 URL解码  From:MKNetworkKit
+ (NSString*) urlDecodedString:(NSString *)string;

//NSData转Base64
+ (NSString *)base64FromData:(NSData *)theData;

//将Dictionary转为url参数所需的 key=value& 形式
-(NSString*) urlEncodedKeyValueStringWithDictionary:(NSDictionary *)theDic;

//将16进制颜色转为10进制 如：0XFF333333
+ (UIColor *)colorWithHex:(uint)hex ;

//url 参数根据&转为dictionary的Key-Value形式
+ (NSDictionary*)dictionaryParametersWithUrlString:(NSString *)str encoding:(NSStringEncoding)encoding;





@end








