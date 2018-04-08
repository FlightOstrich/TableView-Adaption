//
//  MineNewsTableViewCell.h
//  DirectBank
//
//  Created by Cai on 2018/4/2.
//  Copyright © 2018年 xuye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface MineNewsTableViewCell : UITableViewCell

@property(nonatomic,copy)void (^returnIndexPath)(NSIndexPath*index);

@property (nonatomic,  strong)  NewsModel * model;
/** 根据数据自适应高度 */
+ (CGFloat)heightWithModel:(NewsModel *)model;

@end
