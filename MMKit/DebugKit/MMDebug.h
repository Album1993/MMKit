//
//  MMDebug.h
//  logtest
//
//  Created by 张一鸣 on 2017/12/13.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#ifndef MMDebug_h
#define MMDebug_h

#ifdef DEBUG
#define MMLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define MMLog(format, ...)
#endif

#endif /* MMDebug_h */
