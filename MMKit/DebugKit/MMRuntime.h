//
//  MMRuntime.h
//  MMKitDemo
//
//  Created by 张一鸣 on 07/02/2018.
//  Copyright © 2018 张一鸣. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MMRuntime : NSObject

+ (void)swizzlingInClass:(Class)cls
        originalSelector:(SEL)originalSelector
        swizzledSelector:(SEL)swizzledSelector;
@end
