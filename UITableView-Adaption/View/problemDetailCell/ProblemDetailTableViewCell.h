//
//  ProblemDetailTableViewCell.h
//  DirectBank
//
//  Created by Cai on 2018/3/30.
//  Copyright © 2018年 xuye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemDetailModel.h"

@interface ProblemDetailTableViewCell : UITableViewCell

@property(nonatomic,copy)void (^returnIndexPath)(NSIndexPath*index);

@property (nonatomic,  strong)  ProblemDetailModel * model;
/** 根据数据自适应高度 */
+ (CGFloat)heightWithModel:(ProblemDetailModel *)model;

@end
