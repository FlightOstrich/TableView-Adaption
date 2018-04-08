//
//  MineNewsTableViewCell.m
//  DirectBank
//
//  Created by Cai on 2018/4/2.
//  Copyright © 2018年 xuye. All rights reserved.
//

#import "MineNewsTableViewCell.h"
#import "AppConfig.h"

@interface MineNewsTableViewCell()
/** 标题图片*/
@property (nonatomic,  strong)  UIImageView * titleImg;
/** 标题 */
@property (nonatomic,  strong)  UILabel * titleLabel;
/** 时间 */
@property (nonatomic,  strong)  UILabel * timeLabel;
/** 详情 */
@property (nonatomic,  strong)  UILabel * detailLabel;

@end

@implementation MineNewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createCell];
    }
    return self;
}

- (void)createCell
{
    self.titleImg = [[UIImageView alloc] init];
    [self.contentView addSubview:self.titleImg];
    [self.titleImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(11);
        make.width.mas_equalTo(13.5);
        make.height.mas_equalTo(14.5);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleImg.mas_trailing).offset(5);
        make.top.equalTo(self.contentView.mas_top).offset(12);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-135);
        make.height.mas_equalTo(16.5);
    }];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-30);
        make.top.equalTo(self.contentView.mas_top).offset(13);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(14.5);
    }];
    
    UIView*  lineView = [[UIView alloc] init];
    lineView.backgroundColor = RGBColor(238, 238, 238);
    [self.contentView addSubview:lineView];
    [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading);
        make.trailing.equalTo(self.contentView.mas_trailing);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(0.5);
    }];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.font = [UIFont systemFontOfSize:14];
    self.detailLabel.numberOfLines = 0;
    [self.contentView addSubview:self.detailLabel];
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.timeLabel).offset(-3);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
    }];
}

- (void)setModel:(NewsModel *)model
{
    if (model.isRead) {
        self.titleLabel.textColor = RGBColor(102, 102, 102);
        self.timeLabel.textColor = RGBColor(214, 215, 221);
        self.detailLabel.textColor = RGBColor(153, 153, 153);
    }
    else
    {
        self.titleLabel.textColor = RGBColor(51, 51, 51);
        self.timeLabel.textColor = RGBColor(51, 51, 51);
        self.detailLabel.textColor = RGBColor(51, 51, 51);
    }
    self.titleLabel.text = model.titleStr;
    self.timeLabel.text = model.timeStr;
    self.detailLabel.text = model.detailStr;
    // 重新计算约束
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:14.0]};
    CGSize size=[self.detailLabel.text boundingRectWithSize:CGSizeMake(kUIScreenWidth - 80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    [self.contentView addSubview:self.detailLabel];
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.timeLabel).offset(-3);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(size.height);
    }];
}

#pragma mark - 根据model的内容，返回cell的高度
+ (CGFloat)heightWithModel:(NewsModel *)model
{
    MineNewsTableViewCell *cell = [[MineNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MineNewsTableViewCell"];
    [cell setModel:model];
    [cell layoutIfNeeded];
    CGRect frame =  cell.detailLabel.frame;
    NSLog(@"===height=%.2f  ===y=%.2f",frame.size.height,frame.origin.y);
    return frame.origin.y + frame.size.height + 10;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
