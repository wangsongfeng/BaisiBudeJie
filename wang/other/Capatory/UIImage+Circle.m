//
//  UIImage+Circle.m
//  wang
//
//  Created by abc on 16/10/5.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "UIImage+Circle.h"

@implementation UIImage (Circle)
-(UIImage*)circleImage
{
    //不是透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //获取上下文
    CGContextRef contextRef=UIGraphicsGetCurrentContext();
    //添加一个圆
    CGRect rect=CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextAddEllipseInRect(contextRef, rect);
    
    //裁剪
    CGContextClip(contextRef);
    //将图片画上去
    [self drawInRect:rect];
    
    UIImage * image=UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
