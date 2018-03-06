//
//  MMPath.m
//  logtest
//
//  Created by 张一鸣 on 2017/12/12.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import "MMPath.h"


@implementation MMPath

+ (NSString *)home {
    return NSHomeDirectory();
}

+ (NSString *)document {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}


+ (NSString *)library {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)caches {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)temporary {
    return NSTemporaryDirectory();
}

+ (NSString *)mainBundle {
    return [NSBundle mainBundle].resourcePath;
}

@end
