//
//  TabBar.m
//  wang
//
//  Created by abc on 16/10/3.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()
@property(nonatomic,strong)UIButton * publishButton;

@end
@implementation TabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        UITabBarItem * tabBarItem=[UITabBarItem appearance];
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        UIButton * publisgBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [publisgBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publisgBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publisgBtn.size=publisgBtn.currentBackgroundImage.size;
        
        [[publisgBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            NSLog(@"发布按钮点击事件");
        }];
        self.publishButton=publisgBtn;
        [self addSubview:_publishButton];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width=self.width;
    CGFloat height=self.height;
    
    NSInteger index=0;
    CGFloat btnW=width/5;
    CGFloat btnH=height;
    CGFloat btnY=0;
    
    self.publishButton.center=CGPointMake(width/2, height/2);
    for (UIView * view in self.subviews)
    {
        if (![view isKindOfClass:[UIControl class]]||view==self.publishButton)continue;
        {
            CGFloat btnX=(index>1?(index+1):index)*btnW;
            view.frame=CGRectMake(btnX, btnY, btnW, btnH);
            index++;
            
        }
    }
}
@end
