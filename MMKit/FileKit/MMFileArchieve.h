//
//  MMFileArchieve.h
//  logtest
//
//  Created by 张一鸣 on 2017/12/18.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMFileArchieve : NSObject


// ！！重写函数
// ！！重写函数
// ！！重写函数


//#if TARGET_IPHONE_SIMULATOR

// So here's the situation.
// Extended attributes are perfect for what we're trying to do here (marking files as archived).
// This is exactly what extended attributes were designed for.
//
// But Apple screws us over on the simulator.
// Everytime you build-and-go, they copy the application into a new folder on the hard drive,
// and as part of the process they strip extended attributes from our log files.
// Normally, a copy of a file preserves extended attributes.
// So obviously Apple has gone to great lengths to piss us off.
//
// Thus we use a slightly different tactic for marking log files as archived in the simulator.
// That way it "just works" and there's no confusion when testing.
//
// The difference in method names is indicative of the difference in functionality.
// On the simulator we add an attribute by appending a filename extension.
//
// For example:
// "mylog.txt" -> "mylog.archived.txt"
// "mylog"     -> "mylog.archived"

//- (BOOL)hasExtensionAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filepath;
//
//- (void)addExtensionAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filepath;
//- (void)removeExtensionAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filepath;
//
//#else /* if TARGET_IPHONE_SIMULATOR */
//
//// Normal use of extended attributes used everywhere else,
//// such as on Macs and on iPhone devices.
//
//- (BOOL)hasExtendedAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filepath;
//
//- (void)addExtendedAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filepath;
//- (void)removeExtendedAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filepath;
//
//#endif /* if TARGET_IPHONE_SIMULATOR */

@end
