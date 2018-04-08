//
//  ProblemDetailViewController.m
//  DirectBank
//
//  Created by Cai on 2018/3/30.
//  Copyright © 2018年 xuye. All rights reserved.
//

#import "ProblemDetailViewController.h"
#import "ProblemDetailHeadView.h"
#import "ProblemDetailTableViewCell.h"
#import "ProblemDetailModel.h"
#import "AppConfig.h"
static NSString * const RegisterIdentifier_ProblemDetailTableViewCell = @"ProblemDetailTableViewCell";
@interface ProblemDetailViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,  strong)  UITableView * problemDetailTableView;

@property (nonatomic,  strong)  ProblemDetailHeadView * headView;

@property (nonatomic,  strong)  ProblemDetailModel * model;

@end

@implementation ProblemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"详情";
    [self createNetData];
    [self createView];
}

- (void)createNetData
{
    self.model.titleStr = @"问题详情";
    self.model.contentStr = @"测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度测试长度";
    self.model.titleStr = @"问题详情";
    self.headView.model = self.model;
}

- (ProblemDetailModel *)model
{
    if (!_model) {
        _model = [[ProblemDetailModel  alloc] init];
    }
    return _model;
}

- (void)createView
{
    [self.view addSubview:self.headView];
    [self.view addSubview:self.problemDetailTableView];
}

- (UITableView *)problemDetailTableView
{
    if (!_problemDetailTableView) {
        _problemDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 55, kUIScreenWidth, kUIScreenHeight - 55 - kNavBarHeight) style:UITableViewStyleGrouped];
        _problemDetailTableView.backgroundColor = [UIColor whiteColor];
        _problemDetailTableView.delegate = self;
        _problemDetailTableView.dataSource = self;
        _problemDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _problemDetailTableView.showsVerticalScrollIndicator = NO;
        _problemDetailTableView.showsHorizontalScrollIndicator = NO;
        [_problemDetailTableView registerClass:[ProblemDetailTableViewCell class] forCellReuseIdentifier:RegisterIdentifier_ProblemDetailTableViewCell];
    }
    return _problemDetailTableView;
}

- (ProblemDetailHeadView*)headView
{
    if (!_headView) {
        _headView = [[ProblemDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, kUIScreenWidth, 55)];
    }
    return _headView;
}

#pragma mark TableView协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
        
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ProblemDetailTableViewCell heightWithModel:self.model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProblemDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:RegisterIdentifier_ProblemDetailTableViewCell forIndexPath:indexPath];
    cell.model = self.model;
    cell.returnIndexPath = ^(NSIndexPath *indexPath){
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
