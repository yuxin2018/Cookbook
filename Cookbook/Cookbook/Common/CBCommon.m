//
//  CBCommon.m
//  Cookbook
//
//  Created by yu xin on 12-11-28.
//  Copyright (c) 2012年 yuxin2018@gmail.com. All rights reserved.
//

#import "CBCommon.h"

@implementation CBCommon

+ (NSString*)deviceString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSLog(@"NOTE: Unknown device type: %@", [NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding]);
    NSLog(@"NOTE: Unknown device type: %@", [NSString stringWithCString:systemInfo.release encoding:NSUTF8StringEncoding]);
    NSLog(@"NOTE: Unknown device type: %@", [NSString stringWithCString:systemInfo.sysname encoding:NSUTF8StringEncoding]);
    NSLog(@"NOTE: Unknown device type: %@", [NSString stringWithCString:systemInfo.version encoding:NSUTF8StringEncoding]);

    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    
    return deviceString;
}

+(long long)milliSecondsSince1970WithDate:(NSDate *)date
{
    NSTimeInterval interval = [date timeIntervalSince1970];
    long long milliSecond = interval*1000 ;
    return milliSecond;
}

+ (CGSize)sizeWithContent:(NSString *)stringTemp width:(float)width fontSize:(float)fontSize
{
    CGSize constraint = CGSizeMake(width, 20000.0f);
    CGSize size = [stringTemp sizeWithFont:[UIFont boldSystemFontOfSize:fontSize] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    return size;
}

+ (BOOL)isPureInt:(NSString*)string
{
    if(string==nil)
        return NO;
    
    NSScanner* scanner = [NSScanner scannerWithString:string];
    int intTemp;
    return[scanner scanInt:&intTemp] && [scanner isAtEnd];
}

+ (BOOL)isPureFloat:(NSString*)string
{
    if(string==nil)
        return NO;
    NSScanner* scanner = [NSScanner scannerWithString:string];
    float floatTemp;
    return[scanner scanFloat:&floatTemp] && [scanner isAtEnd];
}

+ (BOOL) isValidEmail: (NSString *) email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return ![emailTest evaluateWithObject:email];
}

+ (NSString *)createFileAtCacheWithDirectoryName:(NSString *)directoryName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *diskCachePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:directoryName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:diskCachePath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:diskCachePath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:NULL];
    }
    return diskCachePath;
}

+ (NSString *)createFileAtDocumentWithDirectoryName:(NSString *)directoryName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *diskCachePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:directoryName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:diskCachePath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:diskCachePath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:NULL];
    }
    return diskCachePath;
}

+ (NSString *)encodeURL:(NSString *)string
{
	NSString *newString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding))) ;
	if (newString) {
		return newString;
	}
	return @"";
    
}

+ (NSString *) urlEncodedString:(NSString *)string {
    
    CFStringRef encodedCFString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                          (__bridge CFStringRef) string,
                                                                          nil,
                                                                          CFSTR("?!@#$^&%*+,:;='\"`<>()[]{}/\\| "),
                                                                          kCFStringEncodingUTF8);
    
    NSString *encodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) encodedCFString];
    
    if(!encodedString)
        encodedString = @"";
    
    return encodedString;
}

+ (NSString *) urlDecodedString:(NSString *)string {
    
    CFStringRef decodedCFString = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                          (__bridge CFStringRef)    string,
                                                                                          CFSTR(""),
                                                                                          kCFStringEncodingUTF8);
    
    // We need to replace "+" with " " because the CF method above doesn't do it
    NSString *decodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) decodedCFString];
    return (!decodedString) ? @"" : [decodedString stringByReplacingOccurrencesOfString:@"+" withString:@" "];
}

+ (NSString*)base64FromData:(NSData*)theData
{
	const uint8_t* input = (const uint8_t*)[theData bytes];
	NSInteger length = [theData length];
	
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
	
	NSInteger i,i2;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
		for (i2=0; i2<3; i2++) {
            value <<= 8;
            if (i+i2 < length) {
                value |= (0xFF & input[i+i2]);
            }
        }
		
        NSInteger theIndex = (i / 3) * 4;
        output[theIndex + 0] =                    table[(value >> 18) & 0x3F];
        output[theIndex + 1] =                    table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
	
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] ;
}


-(NSString*) urlEncodedKeyValueStringWithDictionary:(NSDictionary *)theDic
{
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in theDic) {
        
        NSObject *value = [theDic valueForKey:key];
        if([value isKindOfClass:[NSString class]])
            [string appendFormat:@"%@=%@&", [CBCommon urlEncodedString:key], [CBCommon urlEncodedString:(NSString *)value]];
        else
            [string appendFormat:@"%@=%@&", [CBCommon urlEncodedString:key], value];
    }
    
    if([string length] > 0)
        [string deleteCharactersInRange:NSMakeRange([string length] - 1, 1)];
    
    return string;
}


+ (UIColor *)colorWithHex:(uint)hex {
    
    int red, green, blue, alpha;
    
    blue = hex & 0x000000FF;
    green = ((hex & 0x0000FF00) >> 8);
    red = ((hex & 0x00FF0000) >> 16);
    alpha = ((hex & 0xFF000000) >> 24);
    
    return [UIColor colorWithRed:red/255.0f
                           green:green/255.0f
                            blue:blue/255.0f
                           alpha:alpha/255.f];
}


+ (NSDictionary*)dictionaryParametersWithUrlString:(NSString *)str encoding:(NSStringEncoding)encoding
{
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:str];
    
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 1 || kvPair.count == 2) {
            NSString* key = [[kvPair objectAtIndex:0]
                             stringByReplacingPercentEscapesUsingEncoding:encoding];
            if (kvPair.count == 1) {
                [pairs setObject:@"" forKey:key];
                
            } else if (kvPair.count == 2) {
                NSString* value = [[kvPair objectAtIndex:1]
                                   stringByReplacingPercentEscapesUsingEncoding:encoding];
                [pairs setObject:value forKey:key];
                
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:pairs];
}





























@end
