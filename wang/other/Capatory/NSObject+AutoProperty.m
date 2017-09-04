//
//  NSObject+AutoProperty.m
//  wang
//
//  Created by apple on 2017/4/8.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "NSObject+AutoProperty.h"

@implementation NSObject (AutoProperty)
+(void)printPropertyWithDict:(NSDictionary *)dict{
    NSMutableString *allPropertyCode = [[NSMutableString alloc]init];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *oneProperty = [[NSString alloc]init];
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]){
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            oneProperty = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;)",key];
        }
        [allPropertyCode appendFormat:@"\n%@\n",oneProperty];
    }];
    NSLog(@"%@",allPropertyCode);
}
@end
