//
//  PopoerViewController.m
//  wang
//
//  Created by abc on 16/10/12.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "PopoerViewController.h"

@interface PopoerViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * array;
@end

@implementation PopoerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView=[[UITableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.scrollEnabled=NO;
    self.tableView.backgroundColor=[UIColor yellowColor];
    self.array=[[NSMutableArray alloc] initWithObjects:@"扫一扫",@"加好友", @"创建讨论组",@"发送到电脑", @"面对面快传",@"收钱", nil];

    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.array[indexPath.row]];
    return cell;
}

//重写preferredContentSize，返回popover的大小
- (CGSize)preferredContentSize {
    if (self.presentingViewController && self.tableView != nil) {
        CGSize tempSize = self.presentingViewController.view.bounds.size;
        tempSize.width = 150;
        CGSize size = [self.tableView sizeThatFits:tempSize];  //sizeThatFits返回的是最合适的尺寸，但不会改变控件的大小
        return size;
    }else {
        return [super preferredContentSize];
    }
}

@end
