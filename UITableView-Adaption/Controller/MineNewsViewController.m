//
//  MineNewsViewController.m
//  DirectBank
//
//  Created by Cai on 2018/4/2.
//  Copyright © 2018年 Cai. All rights reserved.
//

#import "MineNewsViewController.h"
// Controller
#import "ProblemDetailViewController.h"
// Model
#import "NewsModel.h"
// View
#import "MineNewsTableViewCell.h"
#import "AppConfig.h"
static NSString * const RegisterIdentifier_MineNewsTableViewCell = @"MineNewsTableViewCell";
@interface MineNewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,  strong)  UITableView * newsTableView;

@property (nonatomic,  strong)  NSMutableArray * dataArr;

@property (nonatomic,  strong)  UIView * lineView;

@end

@implementation MineNewsViewController

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kUIScreenWidth, 0.5)];
        _lineView.backgroundColor = RGBColor(238, 238, 238);
    }
    return _lineView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"消息中心";
    [self createNetData];
    [self createView];
}

- (void)createNetData
{
    NewsModel * modelOne = [[NewsModel alloc] init];
    modelOne.titleStr = @"标题标题标题标题标题标题标题标题标题标题标题标题";
    modelOne.timeStr = @"2016-10-11";
    modelOne.detailStr = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    NewsModel * modelTwo = [[NewsModel alloc] init];
    modelTwo.isRead = YES;
    modelTwo.titleStr = @"标题标题标题标题标题标题标题";
    modelTwo.timeStr = @"2016-11-11";
    modelTwo.detailStr = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    NewsModel * modelThree = [[NewsModel alloc] init];
    modelThree.isRead = YES;
    modelThree.titleStr = @"标题标题标题标题标题标题标题";
    modelThree.timeStr = @"2016-11-11";
    modelThree.detailStr = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    NewsModel * modelFour = [[NewsModel alloc] init];
    modelFour.isRead = YES;
    modelFour.titleStr = @"标题标题标题标题标题标题标题";
    modelFour.timeStr = @"2016-11-11";
    modelFour.detailStr = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    NewsModel * modelFive = [[NewsModel alloc] init];
    modelFive.isRead = YES;
    modelFive.titleStr = @"标题标题标题标题标题标题标题";
    modelFive.timeStr = @"2016-11-11";
    modelFive.detailStr = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self.dataArr addObject:modelOne];
    [self.dataArr addObject:modelTwo];
    [self.dataArr addObject:modelThree];
    [self.dataArr addObject:modelFour];
    [self.dataArr addObject:modelFive];
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray  alloc] init];
    }
    return _dataArr;
}

- (void)createView
{
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.newsTableView];
}

- (UITableView *)newsTableView
{
    if (!_newsTableView) {
        _newsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kUIScreenHeight - kNavBarHeight) style:UITableViewStyleGrouped];
        _newsTableView.backgroundColor = [UIColor whiteColor];
        _newsTableView.delegate = self;
        _newsTableView.dataSource = self;
        _newsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _newsTableView.showsVerticalScrollIndicator = NO;
        _newsTableView.showsHorizontalScrollIndicator = NO;
        [_newsTableView registerClass:[MineNewsTableViewCell class] forCellReuseIdentifier:RegisterIdentifier_MineNewsTableViewCell];
    }
    return _newsTableView;
}

#pragma mark TableView协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsModel * model = self.dataArr[indexPath.section];
    return [MineNewsTableViewCell heightWithModel:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineNewsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:RegisterIdentifier_MineNewsTableViewCell forIndexPath:indexPath];
    NewsModel * model = self.dataArr[indexPath.section];
    cell.model = model;
    cell.returnIndexPath = ^(NSIndexPath *indexPath){
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProblemDetailViewController * detailVC = [[ProblemDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
