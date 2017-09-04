//
//  ViewController.m
//  wang
//
//  Created by abc on 16/9/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+Extensions.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * str=@"2016-9-7 21:56:09";
    
    NSLog(@"%@",[self backDate:str]);
    
}
//根据给的数据时间，无论什么时间，返回一个时间
-(NSString*)backDate:(NSString*)creatTime
{
    NSDateFormatter * fmt=[[NSDateFormatter alloc]init];
    fmt.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    fmt.dateFormat=@"yyyy-MM-dd HH:mm:ss";
    
    //创建时间
    NSDate * createDate=[fmt dateFromString:creatTime];
    //当前时间
    NSDate * now=[NSDate date];
    
    //日历
    NSCalendar * calender=[NSCalendar currentCalendar];
    NSCalendarUnit unit=NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents * comps=[calender components:unit fromDate:createDate toDate:now options:0];
    
    if ([createDate isThisYear])
    {
        if ([createDate isYesterday])
        {
            fmt.dateFormat=@"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        }else if ([createDate isToday])
        {
            if (comps.hour>=1)
            {
                return [NSString stringWithFormat:@"%d小时前",(int)comps.hour];
            }else if (comps.minute >= 1) {
                return [NSString stringWithFormat:@"%d分钟前", (int)comps.minute];
            } else {
                return @"刚刚";
            }

            
        }else {
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    }else { //不是今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        return [fmt stringFromDate:createDate];
    }
}
@end
