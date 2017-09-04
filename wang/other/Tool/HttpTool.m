//
//  HttpTool.m
//  wang
//
//  Created by abc on 16/10/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
@implementation HttpTool
+(void)get:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id json))success failure:(void(^)(NSError *error))failure
{
    //显示状态栏的网络指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    AFHTTPSessionManager * mag=[self manager];
    //设置加载时间
    mag.requestSerializer.timeoutInterval=10.0f;
    [mag GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        failure(error);
    }];
    
}
+(AFHTTPSessionManager*)manager
{
    static AFHTTPSessionManager * manager=nil;
    if (manager==nil)
    {
        manager=[AFHTTPSessionManager manager];
    }
    return manager;
}
@end
