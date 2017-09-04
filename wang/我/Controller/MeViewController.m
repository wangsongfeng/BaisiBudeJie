//
//  MeViewController.m
//  wang
//
//  Created by abc on 16/10/3.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "MeViewController.h"
#import "Masonry.h"
#import "GPUImageGaussianBlurFilter.h"
#import "PopoerViewController.h"
@interface MeViewController ()<UIPopoverPresentationControllerDelegate>

@property(nonatomic,strong)PopoerViewController*popView;
@property(nonatomic,strong)UIButton * button;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
//    UIProgressView*progressView=[[UIProgressView alloc]init];
//    progressView.progressViewStyle=UIProgressViewStyleBar;
//    progressView.progress=0.5;
//    progressView.progressTintColor=[UIColor redColor];
//    progressView.trackTintColor=[UIColor cyanColor];
//    [progressView setProgress:0.5 animated:YES];
//
////    progressView.frame=CGRectMake(25, 200, self.view.frame.size.width-150, 0);
////    progressView.transform=CGAffineTransformMakeScale(1.0f, 5.0f);
////    UIImage * image=  [UIImage imageNamed:@"see-big-picture-background"];
//
//    progressView.progressImage=[UIImage imageNamed:@"see-big-picture-background"];
////    progressView.trackImage=[UIImage imageNamed:@"cellmorebtnnormal"];
//       [self.view addSubview:progressView];
//    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.mas_equalTo(50);
//        make.top.mas_equalTo(200);
//        make.width.mas_equalTo(300);
//        make.height.mas_equalTo(30);
//    }];
// 
   
//    [self gaussianImage];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarAction)];
    _button=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    _button.backgroundColor=[UIColor orangeColor];
    [_button addTarget:self action:@selector(rightBarAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
}
-(void)gaussianImage
{
     UIImageView * imageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    
    GPUImageGaussianBlurFilter * gaussian=[[GPUImageGaussianBlurFilter alloc]init];
    gaussian.blurRadiusInPixels=2.0;
    UIImage * image = [UIImage imageNamed:@"bg_zbfx"];
    UIImage *blurredImage = [gaussian imageByFilteringImage:image];
    imageView.image=blurredImage;
    [self.view addSubview:imageView];
}



-(void)rightBarAction
{
    self.popView=[[PopoerViewController alloc]init];
    self.popView.modalPresentationStyle=UIModalPresentationPopover;
    self.popView.popoverPresentationController.permittedArrowDirections=UIPopoverArrowDirectionUp;
    self.popView.popoverPresentationController.delegate=self;
    //设置依附的按钮
//       self.popView.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    self.popView.popoverPresentationController.sourceView=self.button;
    self.popView.popoverPresentationController.sourceRect=self.button.bounds;
    [self presentViewController:self.popView animated:YES completion:nil];
}

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    NSLog(@"%@",controller);
    return UIModalPresentationNone;
}
@end
