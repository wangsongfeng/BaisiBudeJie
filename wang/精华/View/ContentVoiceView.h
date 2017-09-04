//
//  ContentVoiceView.h
//  wang
//
//  Created by abc on 16/10/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class topicModel;

@interface ContentVoiceView : UIView
@property (nonatomic,strong) topicModel *topic;

+(instancetype)voiceView;
//重置
-(void)reset;
@end
