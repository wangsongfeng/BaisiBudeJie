//
//  HttpTool.h
//  wang
//
//  Created by abc on 16/10/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject
+(void)get:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;

@end
