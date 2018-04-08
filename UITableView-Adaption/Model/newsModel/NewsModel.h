//
//  NewsModel.h
//  DirectBank
//
//  Created by Cai on 2018/4/2.
//  Copyright © 2018年 xuye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
/** 是否阅读 */
@property (nonatomic,  assign)  BOOL isRead;
/** 消息标题 */
@property (nonatomic,  copy)  NSString * titleStr;
/** 时间 */
@property (nonatomic,  copy)  NSString * timeStr;
/** 消息详情内容 */
@property (nonatomic,  copy)  NSString * detailStr;

@end
