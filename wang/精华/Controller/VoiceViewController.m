//
//  VoiceViewController.m
//  wang
//
//  Created by abc on 16/10/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "VoiceViewController.h"

@interface VoiceViewController ()
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)ModelDataTool * Tool;
@property (nonatomic,strong) NSMutableArray *topicFrames;
/** 当加载下一页数据时需要的参数 */
@property (nonatomic, copy) NSString *maxtime;
@end

@implementation VoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settableView];
    [self setRefresh];
}

-(void)settableView
{
    self.view.backgroundColor=BackgroundColor;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"TopicTableViewCell" bundle:nil] forCellReuseIdentifier:@"topTabCell"];
    
    
}
//刷新控件
-(void)setRefresh
{
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha=YES;
    [self.tableView.mj_header beginRefreshing];
      self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
}
-(void)getNewData
{
    self.page=0;
    kWeakSelf;
    [self.topicFrames removeAllObjects];
    [self.Tool getDataWithArrayType:TopicTypeVoice parameaterA:@"newlist" block:^(id json, id param) {
        
        for (topicModel * model in json) {
            
            TopicFrame * topFrame=[[TopicFrame alloc]init];
            topFrame.model=model;
            [weakSelf.topicFrames addObject:topFrame];
            
            
        }
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
    }];
    
}

-(void)getMoreData{
    NSInteger page = self.page+1;
    kWeakSelf;
    [self.Tool getDataWithMaxtime:self.maxtime page:@(page) TopicType:TopicTypeVoice parameterA:@"newlist" block:^(id json, id param) {
        NSMutableArray *newArray = [NSMutableArray array];
        for (topicModel *topic in json) {
            TopicFrame *topicFrame = [[TopicFrame alloc]init];
            topicFrame.model = topic;
            [newArray addObject:topicFrame];
        }
        [weakSelf.topicFrames addObjectsFromArray:newArray];
        [weakSelf.tableView reloadData];
        weakSelf.page = page;
        weakSelf.maxtime = param;
        [weakSelf.tableView.mj_footer endRefreshing];
        
    }];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.topicFrames.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicFrame * topFrame=self.topicFrames[indexPath.row];
    
    return topFrame.cellHeight;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topTabCell"];
    cell.topicFrame=self.topicFrames[indexPath.row];
    
    return cell;
}

-(ModelDataTool*)Tool
{
    if (_Tool==nil) {
        _Tool=[[ModelDataTool alloc]init];
    }
    return _Tool;
}
- (NSMutableArray *)topicFrames{
    if (_topicFrames == nil) {
        _topicFrames = [NSMutableArray array];
        
    }
    return _topicFrames;
}
@end
