//
//  ProblemDetailHeadView.m
//  DirectBank
//
//  Created by Cai on 2018/3/30.
//  Copyright © 2018年 xuye. All rights reserved.
//

#import "ProblemDetailHeadView.h"
#import "AppConfig.h"

@interface ProblemDetailHeadView()

@property (nonatomic,  strong)  UIImageView * titleImg;

@property (nonatomic,  strong)  UILabel * titleLabel;

@end

@implementation ProblemDetailHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createView];
    }
    return self;
}

- (void)setModel:(ProblemDetailModel *)model
{
    self.titleLabel.text = model.titleStr;
}

- (void)createView
{
    self.titleImg = [[UIImageView alloc] init];
    [self.titleImg setImage:[UIImage imageNamed:@"mine_ problem"]];
    [self addSubview:self.titleImg];
    [self.titleImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(17);
        make.top.equalTo(self.mas_top).offset(20);
        make.width.mas_equalTo(14);
        make.height.mas_equalTo(15);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = RGBColor(51, 51, 51);
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleImg.mas_trailing).offset(10);
        make.trailing.equalTo(self.mas_trailing).offset(-20);
        make.height.mas_equalTo(17);
        make.centerY.mas_equalTo(self.titleImg.mas_centerY);
    }];
    
    UIView * bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = RGBColor(238, 238, 238);
    [self addSubview:bottomLine];
    [bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading);
        make.trailing.equalTo(self.mas_trailing);
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(0.5);
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
