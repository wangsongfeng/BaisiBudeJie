//
//  TopicFrame.m
//  wang
//
//  Created by apple on 2017/4/9.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "TopicFrame.h"
#import "userModel.h"
static CGFloat avatarMaxY=50;//头像高到顶部
static CGFloat inset=10;// 文字距离头像及相仿视图
static CGFloat toolBarH=50;//评论点赞视图高度
static CGFloat textX=14;//文字X轴
static CGFloat topCMtH=20;//
@implementation TopicFrame


-(void)setModel:(topicModel *)model
{
    _model=model;
    CGFloat textW  =SCREENW-28;
    CGFloat textH=[model.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    //最大Y值
    CGFloat maxY=avatarMaxY+inset*2+textH;
    if (model.type!=TopicTypeTalk) {
        CGFloat contentViewX=textX;
        CGFloat contentViewY=maxY;
        CGFloat contentViewW=textW;
        CGFloat widthScale=model.width/contentViewW;
        CGFloat contentViewH=model.height/widthScale;
        if (model.type==TopicTypeVideo&&contentViewH>250) {
            contentViewH=250;
            model.bigImage=YES;
        }if (contentViewH>1500) {
            contentViewH=300;
            model.bigImage=YES;
        }
        self.contentViewFrame=CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
        maxY=contentViewY+contentViewH+inset;
    }
    
    if (model.top_cmt) {
        NSString * content=[NSString stringWithFormat:@"%@ : %@",model.top_cmt.user.username,model.top_cmt.content];
        CGFloat topcmtContentH = [content boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height;
        maxY = topcmtContentH + topCMtH + maxY + inset;

    }
    //设置cell的高度
    self.cellHeight = maxY + toolBarH;
    
    
}
-(CGSize)size
{
    return CGSizeZero;
}
@end
