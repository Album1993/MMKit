//
//  MMRuntime.h
//  MMKitDemo
//
//  Created by 张一鸣 on 11/01/2018.
//  Copyright © 2018 张一鸣. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MMRuntime : NSObject

// 用来检测是否注册过某个类
+ (BOOL)isRegisteredClass:(Class) class;

// 用来打印所有的类,返回的是class 对象
+ (NSArray *)registeredClasses;

// 用来获得所有class的name
+ (NSArray *)registeredClassNames;

@end

#pragma mark register最佳实践

/*! 这里可以动态的添加，获取，修改某个属性
+ (DDLogLevel)levelForClass:(Class)aClass {
    if ([self isRegisteredClass:aClass]) {
        return [aClass ddLogLevel];
    }
    return (DDLogLevel)-1;
}

+ (DDLogLevel)levelForClassWithName:(NSString *)aClassName {
    Class aClass = NSClassFromString(aClassName);
    
    return [self levelForClass:aClass];
}

+ (void)setLevel:(DDLogLevel)level forClass:(Class)aClass {
    if ([self isRegisteredClass:aClass]) {
        [aClass ddSetLogLevel:level];
    }
}

+ (void)setLevel:(DDLogLevel)level forClassWithName:(NSString *)aClassName {
    Class aClass = NSClassFromString(aClassName);
    [self setLevel:level forClass:aClass];
}
*/
