//
//  NSString+MMString.m
//  MMKitDemo
//
//  Created by 张一鸣 on 2017/12/26.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import "NSString+MMString.h"

@implementation NSString (MMString)

- (NSString *)mm_appendJson:(NSString *)string {
    NSString *jsonString=@"{";
    NSString *key;
    NSError * error ;
    NSDictionary * jsonData1 = [self mm_transJson:error];
    
    if (error) {
#if DEBUG
        NSLog(@"%@",[error localizedDescription]);
#endif
    }
    NSDictionary * jsonData2 = [string mm_transJson:error];
    if (error) {
#if DEBUG
        NSLog(@"%@",[error localizedDescription]);
#endif
    }
    
    for(key in [jsonData1 allKeys])
    {
        jsonString = [jsonString stringByAppendingFormat:@"\"%@\":\"%@\";",key,[jsonData1 objectForKey:key]];
    }
    
    for(key in [jsonData2 allKeys])
    {
        jsonString = [jsonString stringByAppendingFormat:@"\"%@\":\"%@\";",key,[jsonData2 objectForKey:key]];
    }
    jsonString = [jsonString substringToIndex:[jsonString length] - 1];
    jsonString = [jsonString stringByAppendingString:@"}"];
    
    return jsonString;
}

- (NSDictionary *)mm_transJson:(NSError *)error {
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    return dictionary;
}

- (BOOL)mm_isEmptyString {
    if([self length] == 0) { //string isempty or nil
        return YES;
    }
    else if([[self stringByTrimmingCharactersInSet:[NSCharacterSet
                                                     whitespaceCharacterSet]]length] == 0) {
        //string is all whitespace
        return YES;
    }
    return NO;
}

@end
