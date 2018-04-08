//
//  AppConfig.h
//  Thor
//
//  Created by hey on 2016/12/30.
//  Copyright © 2016年 erongdu. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h
#import "Masonry.h"
// 1.获得RGB颜色
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGBColor(r, g, b) RGBAColor(r,g,b,1.0)
//5.定义高度
#define kUIScreenSize [UIScreen mainScreen].bounds.size
#define kUIScreenWidth kUIScreenSize.width
#define kUIScreenHeight kUIScreenSize.height
#define kNavBarHeight 64.0
#define kTabbarHeight 49

#endif /* AppConfig_h */





