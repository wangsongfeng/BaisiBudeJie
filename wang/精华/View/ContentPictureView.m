//
//  ContentPictureView.m
//  wang
//
//  Created by abc on 16/10/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "ContentPictureView.h"
#import "ShowPickerViewController.h"
@interface ContentPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageGif;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *bigPicBtn;
@property (weak, nonatomic) IBOutlet UIImageView *basicView;

@end
@implementation ContentPictureView

+(instancetype)pictureView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
-(void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
    // 给图片添加监听器
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
    [super awakeFromNib];
}
-(void)showPicture {
    
    ShowPickerViewController *showPicVc = [[ShowPickerViewController alloc]init];
    showPicVc.topic = self.topic;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicVc animated:YES completion:nil];
    
}

-(void)setTopic:(topicModel *)topic
{
    _topic=topic;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.middle_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        //判断是不是大图
        if (topic.isBigImage) {
            //如果是的话，则截出图片的最上方铺满contentView
            // 开启图形上下文
            UIGraphicsBeginImageContextWithOptions(self.imageView.size, YES, 0.0);
            // 将下载完的image对象绘制到图形上下文
            CGFloat width = self.imageView.width;
            CGFloat height = width * image.size.height / image.size.width;
            [image drawInRect:CGRectMake(0, 0, width, height)];
            // 获得图片
            self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            // 结束图形上下文
            UIGraphicsEndImageContext();
            self.bigPicBtn.hidden = NO;
        } else {
            self.imageView.contentMode = UIViewContentModeScaleToFill;
            self.bigPicBtn.hidden = YES;
        }

        
    }];
      self.imageGif.hidden = ![topic.middle_image.pathExtension.lowercaseString isEqualToString:@"gif"];
    
}
- (IBAction)bigPicBtn:(UIButton *)sender
{
    NSLog(@"点击展示大图");
    [self showPicture];
}
@end
