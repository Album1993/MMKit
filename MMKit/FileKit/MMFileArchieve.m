//
//  MMFileArchieve.m
//  logtest
//
//  Created by 张一鸣 on 2017/12/18.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import "MMFileArchieve.h"
#import <sys/attr.h>
#import <sys/xattr.h>
#import "MMFileManager.h"

#if TARGET_IPHONE_SIMULATOR
static NSString * const kDDXAttrArchivedName = @"archived";
#else
static NSString * const kDDXAttrArchivedName = @"lumberjack.log.archived";
#endif

@implementation MMFileArchieve

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//#if TARGET_IPHONE_SIMULATOR
//
//// Extended attributes don't work properly on the simulator.
//// So we have to use a less attractive alternative.
//// See full explanation in the header file.
//
//- (BOOL)hasExtensionAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filePath {
//    // This method is only used on the iPhone simulator, where normal extended attributes are broken.
//    // See full explanation in the header file.
//
//    // Split the file name into components. File name may have various format, but generally
//    // structure is same:
//    //
//    // <name part>.<extension part> and <name part>.archived.<extension part>
//    // or
//    // <name part> and <name part>.archived
//    //
//    // So we want to search for the attrName in the components (ignoring the first array index).
//
//    NSString * filename  = [MMFileManager fileNameAtPath:filePath];
//    NSArray *components = [filePath componentsSeparatedByString:@"."];
//
//    // Watch out for file names without an extension
//
//    for (NSUInteger i = 1; i < components.count; i++) {
//        NSString *attr = components[i];
//
//        if ([attrName isEqualToString:attr]) {
//            return YES;
//        }
//    }
//
//    return NO;
//}
//
//- (void)addExtensionAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filePath {
//    // This method is only used on the iPhone simulator, where normal extended attributes are broken.
//    // See full explanation in the header file.
//
//    if ([attrName length] == 0) {
//        return;
//    }
//
//    // Example:
//    // attrName = "archived"
//    //
//    // "mylog.txt" -> "mylog.archived.txt"
//    // "mylog"     -> "mylog.archived"
//    NSString * filename  = [MMFileManager fileNameAtPath:filePath]
//    NSArray *components = [filename componentsSeparatedByString:@"."];
//
//    NSUInteger count = [components count];
//
//    NSUInteger estimatedNewLength = [filename length] + [attrName length] + 1;
//    NSMutableString *newFileName = [NSMutableString stringWithCapacity:estimatedNewLength];
//
//    if (count > 0) {
//        [newFileName appendString:components.firstObject];
//    }
//
//    NSString *lastExt = @"";
//
//    NSUInteger i;
//
//    for (i = 1; i < count; i++) {
//        NSString *attr = components[i];
//
//        if ([attr length] == 0) {
//            continue;
//        }
//
//        if ([attrName isEqualToString:attr]) {
//            // Extension attribute already exists in file name
//            return;
//        }
//
//        if ([lastExt length] > 0) {
//            [newFileName appendFormat:@".%@", lastExt];
//        }
//
//        lastExt = attr;
//    }
//
//    [newFileName appendFormat:@".%@", attrName];
//
//    if ([lastExt length] > 0) {
//        [newFileName appendFormat:@".%@", lastExt];
//    }
//
//    [self renameFile:newFileName];
//}
//
//- (void)removeExtensionAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filePath{
//    // This method is only used on the iPhone simulator, where normal extended attributes are broken.
//    // See full explanation in the header file.
//
//    if ([attrName length] == 0) {
//        return;
//    }
//
//    // Example:
//    // attrName = "archived"
//    //
//    // "mylog.archived.txt" -> "mylog.txt"
//    // "mylog.archived"     -> "mylog"
//
//
//    NSArray *components = [[self fileName] componentsSeparatedByString:@"."];
//
//    NSUInteger count = [components count];
//
//    NSUInteger estimatedNewLength = [[self fileName] length];
//    NSMutableString *newFileName = [NSMutableString stringWithCapacity:estimatedNewLength];
//
//    if (count > 0) {
//        [newFileName appendString:components.firstObject];
//    }
//
//    BOOL found = NO;
//
//    NSUInteger i;
//
//    for (i = 1; i < count; i++) {
//        NSString *attr = components[i];
//
//        if ([attrName isEqualToString:attr]) {
//            found = YES;
//        } else {
//            [newFileName appendFormat:@".%@", attr];
//        }
//    }
//
//    if (found) {
//        [self renameFile:newFileName];
//    }
//}
//
//#else /* if TARGET_IPHONE_SIMULATOR */
//
//- (BOOL)hasExtendedAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filePath{
//    const char *path = [filePath UTF8String];
//    const char *name = [attrName UTF8String];
//
//    ssize_t result = getxattr(path, name, NULL, 0, 0, 0);
//
//    return (result >= 0);
//}
//
//- (void)addExtendedAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filePath{
//    const char *path = [filePath UTF8String];
//    const char *name = [attrName UTF8String];
//
//    int result = setxattr(path, name, NULL, 0, 0, 0);
//
//    if (result < 0) {
//#if DEBUG
//        NSLog(@"DDLogFileInfo: setxattr(%@, %@): error = %s",
//                   attrName,
//                   filePath,
//                   strerror(errno));
//#endif
//    }
//}
//
//- (void)removeExtendedAttributeWithName:(NSString *)attrName withFilePath:(NSString *)filePath{
//    const char *path = [filePath UTF8String];
//    const char *name = [attrName UTF8String];
//
//    int result = removexattr(path, name, 0);
//
//    if (result < 0 && errno != ENOATTR) {
//#if DEBUG
//        NSLog(@"DDLogFileInfo: removexattr(%@, %@): error = %s",
//                   attrName,
//                   filePath,
//                   strerror(errno));
//#endif
//    }
//}
//
//#endif /* if TARGET_IPHONE_SIMULATOR */
//
//- (void)renameFile:(NSString *)newFileName filename:(NSString *)filepath{
//    // This method is only used on the iPhone simulator, where normal extended attributes are broken.
//    // See full explanation in the header file.
//    NSLog(@"new filename:%@",newFileName);
//    NSString * filename = [MMFileManager fileNameAtPath:filepath];
//    if (![newFileName isEqualToString:filename]) {
//        NSString *fileDir = [filepath stringByDeletingLastPathComponent];
//
//        NSString *newFilePath = [fileDir stringByAppendingPathComponent:newFileName];
//#if DEBUG
//        NSLog(@"DDLogFileInfo: Renaming file: '%@' -> '%@'", filename, newFileName);
//#endif
//        NSError *error = nil;
//
//        if ([[NSFileManager defaultManager] fileExistsAtPath:newFilePath] &&
//            ![[NSFileManager defaultManager] removeItemAtPath:newFilePath error:&error]) {
//#if DEBUG
//
//            NSLog(@"DDLogFileInfo: Error deleting archive (%@): %@", filename, error);
//#endif
//
//        }
//
//        if (![[NSFileManager defaultManager] moveItemAtPath:filepath toPath:newFilePath error:&error]) {
//#if DEBUG
//
//            NSLogError(@"DDLogFileInfo: Error renaming file (%@): %@", filename, error);
//#endif
//        }
//
//        filepath = newFilePath;
//
//        [self reset];
//    }
//}



@end
