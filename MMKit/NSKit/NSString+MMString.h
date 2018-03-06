//
//  NSString+MMString.h
//  MMKitDemo
//
//  Created by 张一鸣 on 2017/12/26.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (MMString)

// 这个string本身就是json
- (NSString *)mm_appendJson:(NSString *)string;

- (NSDictionary *)mm_transJson:(NSError *)error;

- (BOOL)mm_isEmptyString;

- (id)mm_jsonObject:(NSError *)error;

@end
