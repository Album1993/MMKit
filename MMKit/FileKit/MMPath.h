//
//  MMPath.h
//  logtest
//
//  Created by 张一鸣 on 2017/12/12.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MMPath : NSObject

// 获取沙盒主目录路径
+ (NSString *)home;

// 获取Documents目录路径
+ (NSString *)document;

// 获取Library的目录路径
+ (NSString *)library;

// 获取Caches目录路径
+ (NSString *)caches;

// 获取tmp目录路径
+ (NSString *)temporary;

// Bundle
+ (NSString *)mainBundle;


@end
