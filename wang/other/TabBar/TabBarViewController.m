//
//  TabBarViewController.m
//  wang
//
//  Created by abc on 16/10/3.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationViewController.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "ConcentViewController.h"
#import "MeViewController.h"
#import "TabBar.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    [self setValue:[[TabBar alloc]init] forKey:@"tabBar"];
}
//初始化子控制器
-(void)initController
{
    [self setupController:[[EssenceViewController alloc]init] image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" title:@"精华"];
     [self setupController:[[NewViewController alloc]init] image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" title:@"最新"];
     [self setupController:[[ConcentViewController alloc]init] image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" title:@"关注"];
     [self setupController:[[MeViewController alloc]init] image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" title:@"我"];
    
}
-(void)setupController:(UIViewController*)childVc image:(NSString*)image selectedImage:(NSString*)selectedImage title:(NSString*)title
{
    UIViewController * viewVc=childVc;
    viewVc.tabBarItem.image=[UIImage imageNamed:image];
    viewVc.tabBarItem.selectedImage=[UIImage imageNamed:selectedImage];
    viewVc.tabBarItem.title=title;
    NavigationViewController * nav=[[NavigationViewController alloc]initWithRootViewController:viewVc];
    [self addChildViewController:nav];
}

@end
