//
//  ContentVideoView.h
//  wang
//
//  Created by abc on 16/10/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class topicModel;

@interface ContentVideoView : UIView
@property (nonatomic,strong) topicModel *topic;

+(instancetype)videoView;
-(void)reset;
@end
