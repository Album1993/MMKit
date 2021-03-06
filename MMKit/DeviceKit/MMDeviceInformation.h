//
//  MMDeviceInformation.h
//  logtest
//
//  Created by 张一鸣 on 2017/12/12.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MMDeviceInformation : NSObject

// ios 不允许获得IMEI 使用这个代替
+ (NSString *)UUID;

+ (NSInteger)timeStamp;

+ (NSString *)IMSI;

+ (NSString *)language;

+ (NSString *)os_version;

+ (NSString *)platform;

+ (NSString *)platformString;

+ (NSString *)appVersion;

// 处理器数量
+ (NSUInteger)processesCount;

+ (NSString *)systemLanguage;

@end
