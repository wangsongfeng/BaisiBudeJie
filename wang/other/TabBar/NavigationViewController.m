//
//  NavigationViewController.m
//  wang
//
//  Created by abc on 16/10/3.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()
@property(nonatomic,strong)UIButton * backBtn;
@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

//只初始化一次
+(void)initialize
{
    UIImage * backgroundImage=[UIImage imageNamed:@"navigationbarBackgroundWhite"];
    UINavigationBar * bar=[UINavigationBar appearance];
    [bar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSFontAttributeName :[UIFont boldSystemFontOfSize:20]}];
}
//当push时的控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count)
    {
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:YES];
}
-(UIButton *)backBtn
{
    if (_backBtn==nil)
    {
        _backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [_backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        _backBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        _backBtn.contentEdgeInsets=UIEdgeInsetsMake(0, -5, 0, 0);
        [_backBtn sizeToFit];
        
     
        [[_backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [self popViewControllerAnimated:YES];
        }];
        
    }
    return _backBtn;
}
@end
