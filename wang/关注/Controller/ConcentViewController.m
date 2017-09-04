//
//  ConcentViewController.m
//  wang
//
//  Created by abc on 16/10/3.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "ConcentViewController.h"
#import "DOPDropDownMenu.h"
@interface ConcentViewController ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>
@property(nonatomic,strong)DOPDropDownMenu * menu;
@property (nonatomic, strong) NSArray *evenythingS;
@property (nonatomic, strong) NSArray *twoSizeS;
@property (nonatomic, strong) NSArray *thrreSizeS;
@property (nonatomic, strong) NSArray *fourSizeS;
@property (nonatomic, strong) NSArray *timeS;
@property (nonatomic, strong) NSArray *hotS;
@property (nonatomic, strong) NSArray *evenythingImageS;
@property (nonatomic, strong) NSArray *timeImageS;
@property (nonatomic, strong) NSArray *hotImageS;
@end

@implementation ConcentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 标题
    self.evenythingS = @[@"全部分类",@"两个字",@"三个字",@"四个字"];
    self.twoSizeS = @[@"布艺",@"皮艺",@"纸艺",@"编织",@"饰品",@"木艺",@"刺绣",@"模型"];
    self.thrreSizeS = @[@"羊毛毡",@"橡皮章"];
    self.fourSizeS = @[@"黏土陶艺",@"园艺多肉",@"手绘印刷",@"手工护肤",@"美食烘焙",@"旧物改造",@"滴胶热缩",@"电子科技",@"雕塑雕刻",@"金属工艺"];
    self.timeS = @[@"一周",@"一月",@"全部教程"];
    self.hotS = @[@"最热教程",@"最新更新",@"评论最多",@"收藏最多",@"材料包有售",@"成品有售"];
    
    
    // 图片
    self.evenythingImageS = @[@"sgk_course_cate_all"];
    self.timeImageS = @[@"sgk_course_time_week",@"sgk_course_time_month",@"sgk_course_time_all"];
    self.hotImageS = @[@"sgk_course_sort_new",@"sgk_course_sort_hot",@"sgk_course_sort_comment",@"sgk_course_sort_collect",@"sgk_course_sort_material",@"sgk_course_sort_product"];
 [self addDropMenu];
}

-(void)addDropMenu
{
    DOPDropDownMenu * menu=[[DOPDropDownMenu alloc]initWithOrigin:CGPointMake(0, 64) andHeight:30];
    menu.delegate=self;
    menu.dataSource=self;
    
    [self.view addSubview:menu];
    
    self.menu=menu;
    [menu selectDefalutIndexPath];
    
}

//数据源
-(NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}
-(NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column==0)
    {
        return self.evenythingS.count;
    }else if (column==1)
    {
        return self.timeS.count;
    }else
    {
        return self.hotS.count;
    }
}
-(NSString*)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.evenythingS[indexPath.row];
    }else if (indexPath.column == 1){
        return self.timeS[indexPath.row];
    }else{
        return self.hotS[indexPath.row];
    }

}
- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForRowAtIndexPath:(DOPIndexPath *)indexPath;
{
    if (indexPath.column == 0) {
        return self.evenythingImageS[0];
    }else if (indexPath.column == 1){
        return self.timeImageS[indexPath.row];
    }else{
        return self.hotImageS[indexPath.row];
    }
}
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column;
{
    if (column == 0) {
        if (row == 1) {
            return self.twoSizeS.count;
        }else if (row == 2){
            return self.thrreSizeS.count;
        }else if (row == 3){
            return self.fourSizeS.count;
        }
    }
    return 0;
}
- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;
{
    if (indexPath.column == 0) {
        if (indexPath.row == 1) {
            return self.twoSizeS[indexPath.item];
        }else if (indexPath.row == 2){
            return self.thrreSizeS[indexPath.item];
        }else if (indexPath.row == 3){
            return self.fourSizeS[indexPath.item];
        }
    }
    return nil;
}
- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath;
{
    if(indexPath.column == 0){
        if (indexPath.item >= 0) {
            return @"sgk_course_cate_cixiubianzhi";
        }
    }
    return nil;
}

@end
