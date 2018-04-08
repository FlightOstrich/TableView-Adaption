//
//  ProblemDetailTableViewCell.m
//  DirectBank
//
//  Created by Cai on 2018/3/30.
//  Copyright © 2018年 xuye. All rights reserved.
//

#import "ProblemDetailTableViewCell.h"
#import "AppConfig.h"

@interface ProblemDetailTableViewCell()

@property (nonatomic,  strong)  UILabel * contentLabel;

@end

@implementation ProblemDetailTableViewCell

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
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.textColor = RGBColor(102, 102, 102);
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    self.contentLabel.numberOfLines = 0;
    [self.contentView addSubview:self.contentLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0]};
    CGSize size=[self.contentLabel.text boundingRectWithSize:CGSizeMake(kUIScreenWidth - 80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    self.contentLabel.frame = CGRectMake(40, 10, kUIScreenWidth - 80, size.height);
}

- (void)setModel:(ProblemDetailModel *)model
{
    self.contentLabel.text = model.contentStr;
}

#pragma mark - 根据model的内容，返回cell的高度
+ (CGFloat)heightWithModel:(ProblemDetailModel *)model
{
    ProblemDetailTableViewCell *cell = [[ProblemDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProblemDetailTableViewCell"];
    [cell setModel:model];
    [cell layoutIfNeeded];
    CGRect frame =  cell.contentLabel.frame;
    NSLog(@"===height=%.2f  ===y=%.2f",frame.size.height,frame.origin.y);
    return frame.origin.y + frame.size.height + 20;
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
