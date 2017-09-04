//
//  ModelDataTool.h
//  wang
//
//  Created by abc on 16/10/5.
//  Copyright © 2016年 abc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelDataTool : NSObject
/**
 *  首次刷新（不需要传页数）
 *
 *  @param block回调
 */
-(void)getDataWithArrayType:(TopicType)type parameaterA:(NSString*)parameaterA block:(void(^)(id json,id param))block;

/**
 *加载更多数据（需要传页数）
 *
 *  @param maxtime 参数
 *  @param page    页码
 *  @param block回调
 */

-(void)getDataWithMaxtime:(NSString *)maxtime page:(NSNumber *)page TopicType:(TopicType)type parameterA:(NSString *)parameterA block:(void (^)(id json,id param))block;
@end
