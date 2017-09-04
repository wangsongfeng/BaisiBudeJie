//
//  TopicTableViewCell.m
//  wang
//
//  Created by abc on 16/10/5.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ContentPictureView.h"
#import "ContentVideoView.h"
#import "ContentVoiceView.h"
@interface TopicTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *touXiangImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *creatTime;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIView *topCommentView;
@property (weak, nonatomic) IBOutlet UILabel *topCommentText;


@property(nonatomic,strong)ContentPictureView * pictureView;
@property(nonatomic,strong)ContentVideoView * videoView;
@property(nonatomic,strong)ContentVoiceView * voiceView;

@end
@implementation TopicTableViewCell
//队列重用时
-(void)prepareForReuse
{
    [super prepareForReuse];
    [_videoView reset];
    [_voiceView reset];
}
- (void)awakeFromNib {

    [super awakeFromNib];
    
}
+ (instancetype)cell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

-(void)setTopicFrame:(TopicFrame *)topicFrame
{
    _topicFrame=topicFrame;
    topicModel * model=topicFrame.model;
    [self.touXiangImage setHeader:model.profile_image];
    self.name.text=model.name;
    self.creatTime.text=model.created_at;
    self.text.text=model.text;
    
    [self.dingBtn setTitle:[NSString stringWithFormat:@"%ld",model.ding] forState:UIControlStateNormal];
    [self.caiBtn setTitle:[NSString stringWithFormat:@"%ld",model.cai] forState:UIControlStateNormal];
    [self.shareBtn setTitle:[NSString stringWithFormat:@"%ld",model.repost] forState:UIControlStateNormal];
    [self.commentBtn setTitle:[NSString stringWithFormat:@"%ld",model.comment] forState:UIControlStateNormal];
    
    // 处理最热评论
    if (model.top_cmt) {
        self.topCommentView.hidden = NO;
        self.topCommentText.text = [NSString stringWithFormat:@"%@ : %@", model.top_cmt.user.username, model.top_cmt.content];
    } else {
        self.topCommentView.hidden = YES;
    }
    
    if (model.type == TopicTypePicture) {
        self.pictureView.topic = model;
        self.pictureView.frame  = topicFrame.contentViewFrame;
        self.pictureView.hidden = NO;
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
    } else if (model.type == TopicTypeVideo) {
        self.videoView.topic = model;
        self.videoView.frame  = topicFrame.contentViewFrame;
        self.videoView.hidden = NO;
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
    } else if (model.type == TopicTypeVoice) {
        self.voiceView.topic = model;
        self.voiceView.frame  = topicFrame.contentViewFrame;
        self.voiceView.hidden = NO;
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;

    }else {
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
    }


    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)moreAlert:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *save = [UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *report = [UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:report];
    [alertController addAction:cancel];
    [alertController addAction:save];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}
//重新设置尺寸
-(void)setFrame:(CGRect)frame {
    CGFloat inset = 10;
    frame.size.height -= inset;
    frame.origin.y += inset;
    [super setFrame:frame];
}
- (IBAction)CommentClick:(UIButton *)sender {
}
-(ContentPictureView*)pictureView
{
    if (!_pictureView)
    {
        _pictureView=[ContentPictureView pictureView];
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}

-(ContentVideoView*)videoView
{
    if (!_videoView)
    {
        _videoView=[ContentVideoView videoView];
        [self.contentView addSubview:_videoView];
    }
    return _videoView;
}

-(ContentVoiceView*)voiceView
{
    if (!_voiceView)
    {
        _voiceView=[ContentVoiceView voiceView];
        [self.contentView addSubview:_voiceView];
    }
    return _voiceView;
}
@end
