//
//  ContentVoiceView.m
//  wang
//
//  Created by abc on 16/10/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "ContentVoiceView.h"

@interface ContentVoiceView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCount;
@property (weak, nonatomic) IBOutlet UILabel *playTime;

@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@end
@implementation ContentVoiceView

-(void)awakeFromNib
{
    self.autoresizingMask=UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled=YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
    [super awakeFromNib];
    
}
+(instancetype)voiceView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
    
}
-(void)setTopic:(topicModel *)topic {
    
    _topic = topic;
    self.playCount.text = [NSString stringWithFormat:@"%ld播放",(long)topic.playcount];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.middle_image]];
    self.playTime.text = [NSString stringWithFormat:@"%02ld:%02ld", topic.voicetime / 60, topic.voicetime % 60];
    
}
-(void)showPicture
{
    NSLog(@"点击了图片");
}
- (IBAction)button:(UIButton *)sender
{
    NSLog(@"点击了播放按钮");
}

//重置
-(void)reset
{
    
}

@end
