//
//  MMRuntime.m
//  MMKitDemo
//
//  Created by 张一鸣 on 11/01/2018.
//  Copyright © 2018 张一鸣. All rights reserved.
//

#import "MMRuntime.h"
#import <objc/runtime.h>


@implementation MMRuntime


+ (BOOL)isRegisteredClass:(Class) class {
    SEL getterSel = @selector(ddLogLevel);
    SEL setterSel = @selector(ddSetLogLevel:);

#if TARGET_OS_IPHONE && !TARGET_OS_SIMULATOR

    // Issue #6 (GoogleCode) - Crashes on iOS 4.2.1 and iPhone 4
    //
    // Crash caused by class_getClassMethod(2).
    //
    //     "It's a bug with UIAccessibilitySafeCategory__NSObject so it didn't pop up until
    //      users had VoiceOver enabled [...]. I was able to work around it by searching the
    //      result of class_copyMethodList() instead of calling class_getClassMethod()"

    BOOL result = NO;

    unsigned int methodCount, i;
    Method *     methodList = class_copyMethodList(object_getClass(class), &methodCount);

    if (methodList != NULL) {
        BOOL getterFound = NO;
        BOOL setterFound = NO;

        for (i = 0; i < methodCount; ++i) {
            SEL currentSel = method_getName(methodList[i]);

            if (currentSel == getterSel) {
                getterFound = YES;
            } else if (currentSel == setterSel) {
                setterFound = YES;
            }

            if (getterFound && setterFound) {
                result = YES;
                break;
            }
        }

        free(methodList);
    }

    return result;

#else /* if TARGET_OS_IPHONE && !TARGET_OS_SIMULATOR */

    // Issue #24 (GitHub) - Crashing in in ARC+Simulator
    //
    // The method +[DDLog isRegisteredClass] will crash a project when using it with ARC + Simulator.
    // For running in the Simulator, it needs to execute the non-iOS code.

    Method getter = class_getClassMethod(class, getterSel);
    Method setter = class_getClassMethod(class, setterSel);

    if ((getter != NULL) && (setter != NULL)) {
        return YES;
    }

    return NO;

#endif /* if TARGET_OS_IPHONE && !TARGET_OS_SIMULATOR */
}

    + (NSArray *)registeredClasses {
    // We're going to get the list of all registered classes.
    // The Objective-C runtime library automatically registers all the classes defined in your source code.
    //
    // To do this we use the following method (documented in the Objective-C Runtime Reference):
    //
    // int objc_getClassList(Class *buffer, int bufferLen)
    //
    // We can pass (NULL, 0) to obtain the total number of
    // registered class definitions without actually retrieving any class definitions.
    // This allows us to allocate the minimum amount of memory needed for the application.

    NSUInteger numClasses = 0;
    Class *    classes    = NULL;

    while (numClasses == 0) {
        numClasses = (NSUInteger)MAX(objc_getClassList(NULL, 0), 0);

        // numClasses now tells us how many classes we have (but it might change)
        // So we can allocate our buffer, and get pointers to all the class definitions.

        NSUInteger bufferSize = numClasses;

        classes = numClasses ? (Class *)malloc(sizeof(Class) * bufferSize) : NULL;
        if (classes == NULL) {
            return @[]; //no memory or classes?
        }

        numClasses = (NSUInteger)MAX(objc_getClassList(classes, (int)bufferSize), 0);

        if (numClasses > bufferSize || numClasses == 0) {
            //apparently more classes added between calls (or a problem); try again
            free(classes);
            numClasses = 0;
        }
    }

    // We can now loop through the classes, and test each one to see if it is a DDLogging class.

    NSMutableArray *result = [NSMutableArray arrayWithCapacity:numClasses];

    for (NSUInteger i = 0; i < numClasses; i++) {
        Class class = classes[i];

        if ([self isRegisteredClass:class]) {
            [result addObject:class];
        }
    }

    free(classes);

    return result;
}

+ (NSArray *)registeredClassNames {
    NSArray *registeredClasses = [self registeredClasses];
    NSMutableArray *result     = [NSMutableArray arrayWithCapacity:[registeredClasses count]];

    for (Class class in registeredClasses) {
        [result addObject:NSStringFromClass(class)];
    }
    return result;
}

@end
