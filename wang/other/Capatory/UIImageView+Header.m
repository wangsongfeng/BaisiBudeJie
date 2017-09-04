//
//  UIImageView+Header.m
//  wang
//
//  Created by abc on 16/10/5.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "UIImageView+Header.h"
#import "UIImage+Circle.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (Header)
-(void)setHeader:(NSString*)url
{
    UIImage * placeholder=[[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        self.image=image?[image circleImage]:placeholder;
        
    }];
}
@end
