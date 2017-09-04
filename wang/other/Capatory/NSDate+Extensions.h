//
//  NSDate+Extensions.h
//  wang
//
//  Created by abc on 16/9/7.
//  Copyright © 2016年 abc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extensions)
/**
 *  判断某个时间是否为今年
 */
-(BOOL)isThisYear;
/**
 *  判断是否为昨天
 */
-(BOOL)isYesterday;
/**
 *  判断是否为今天
 */
-(BOOL)isToday;
@end
