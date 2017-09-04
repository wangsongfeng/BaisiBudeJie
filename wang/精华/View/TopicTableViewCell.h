//
//  TopicTableViewCell.h
//  wang
//
//  Created by abc on 16/10/5.
//  Copyright © 2016年 abc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicFrame.h"
@interface TopicTableViewCell : UITableViewCell

@property(nonatomic,strong)TopicFrame * topicFrame;
+ (instancetype)cell;
@end
