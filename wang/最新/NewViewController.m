//
//  NewViewController.m
//  wang
//
//  Created by abc on 16/10/3.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "NewViewController.h"
#import "XWTransitionAnimator.h"
#import "XWCircleSpreadAnimator.h"
#import "UIViewController+XWTransition.h"

#import "MeViewController.h"
@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, 64, 50, 50)];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)Click
{
    XWCircleSpreadAnimator * animator=[XWCircleSpreadAnimator xw_animatorWithStartCenter:CGPointMake(self.view.frame.size.width-50, 64+50) radius:0];
    MeViewController * meView=[[MeViewController alloc]init];
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:meView];
    [self xw_presentViewController:nav withAnimator:animator];
    
    
}

@end
