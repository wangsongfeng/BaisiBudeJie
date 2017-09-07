//
//  ModelDataTool.m
//  wang
//
//  Created by abc on 16/10/5.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "ModelDataTool.h"
#import "HttpTool.h"
#import "MJExtension.h"
@implementation ModelDataTool
/**
 *  首次刷新（不需要传页数）
 *
 *  @param block回调
 */
-(void)getDataWithArrayType:(TopicType)type parameaterA:(NSString*)parameaterA block:(void(^)(id json,id param))block
{
    //参数
    NSMutableDictionary * parameDic=[NSMutableDictionary dictionary];
    parameDic[@"a"]=parameaterA;
    parameDic[@"c"]=@"data";
    parameDic[@"type"]=@(type);
   // http://api.budejie.com/api/api_open.php?a=newlist&c=data&type=type
    [HttpTool get:BaseURL parameters:parameDic success:^(id json) {
       
        NSArray * array=[topicModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        NSString * maxtime=json[@"info"][@"maxtime"];
        block(array,maxtime);
        
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

/**
 *加载更多数据（需要传页数）
 *
 *  @param maxtime 参数
 *  @param page    页码
 *  @param block回调
 */

-(void)getDataWithMaxtime:(NSString *)maxtime page:(NSNumber *)page TopicType:(TopicType)type parameterA:(NSString *)parameterA block:(void (^)(id json,id param))block
{
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = parameterA;
    params[@"c"] = @"data";
    params[@"type"] = @(type);
    params[@"page"] = page;
    params[@"maxtime"] = maxtime;
    
    [HttpTool get:BaseURL parameters:params success:^(id json) {
        
        NSArray *talkMoreArray = [topicModel mj_objectArrayWithKeyValuesArray:json[@"list"]];
        
        NSString *maxTime = json[@"info"][@"maxtime"];
        block(talkMoreArray,maxTime);
        
    } failure:^(NSError *error) {
        nil;
    }];

}
@end
