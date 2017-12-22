//
//  MMLife.h
//  logtest
//
//  Created by 张一鸣 on 2017/12/13.
//  Copyright © 2017年 张一鸣. All rights reserved.
//


#ifndef MMLife_h
#define MMLife_h

#import <Foundation/Foundation.h>
#import "MMDebug.h"

static void objectCleanUp(__strong NSObject ** object) {
    MMDebug(@"%@",object);
}

static void blockCleanUp(__strong void(^*block)(void)) {
    (*block)();
}

#ifndef MMonExitObject
#define MMonExitObject\
__strong void NSObject * a __attribute__((cleanup(objectCleanUp))) =
#endif

#ifndef MMonExitBlock
#define MMonExitBlock\
__strong void(^block)(void) __attribute__((cleanup(blockCleanUp), unused)) = ^
#endif

#endif /* MMLife_h */
