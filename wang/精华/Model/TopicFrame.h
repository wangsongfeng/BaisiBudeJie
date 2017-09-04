//
//  TopicFrame.h
//  wang
//
//  Created by apple on 2017/4/9.
//  Copyright © 2017年 abc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "topicModel.h"
@interface TopicFrame : NSObject
@property(nonatomic,strong)topicModel * model;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGRect contentViewFrame;

@end
