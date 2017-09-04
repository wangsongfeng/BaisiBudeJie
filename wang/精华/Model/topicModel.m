//
//  topicModel.m
//  wang
//
//  Created by apple on 2017/4/8.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "topicModel.h"
#import "MJExtension.h"
#import "CommentModel.h"
@implementation topicModel
+(NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2",
             @"ID" : @"id",
             @"top_cmt" : @"top_cmt[0]"
             };
}
@end
