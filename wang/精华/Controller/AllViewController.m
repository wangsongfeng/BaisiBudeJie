//
//  AllViewController.m
//  wang
//
//  Created by abc on 16/10/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "AllViewController.h"
#import "TopicTableViewCell.h"
#import "MJRefresh.h"
#import "TopicFrame.h"

@interface AllViewController ()


@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)ModelDataTool * Tool;
@property (nonatomic,strong) NSMutableArray *topicFrames;

@end

@implementation AllViewController

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
}
-(void)getNewData
{
    self.page=0;
    kWeakSelf;
    [self.topicFrames removeAllObjects];
    [self.Tool getDataWithArrayType:TopicTypeAll parameaterA:@"newlist" block:^(id json, id param) {
      
        for (topicModel * model in json) {

            TopicFrame * topFrame=[[TopicFrame alloc]init];
            topFrame.model=model;
            [weakSelf.topicFrames addObject:topFrame];

            
        }
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];

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
