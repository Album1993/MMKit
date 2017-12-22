//
//  MMDeviceInformation.m
//  logtest
//
//  Created by 张一鸣 on 2017/12/12.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import "MMDeviceInformation.h"

@implementation MMDeviceInformation

+(NSString *)UDID {
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strRef = CFUUIDCreateString(kCFAllocatorDefault , uuidRef);
    NSString *uuidString = [(__bridge NSString*)strRef stringByReplacingOccurrencesOfString:@"-" withString:@""];
    CFRelease(strRef);
    CFRelease(uuidRef);
    return uuidString;
}

@end
