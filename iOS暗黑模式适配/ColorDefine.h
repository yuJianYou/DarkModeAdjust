//
//  ColorDefine.h
//  PodDemo
//
//  Created by Apple on 2019/12/24.
//  Copyright © 2019 Apple. All rights reserved.
//

#ifndef ColorDefine_h
#define ColorDefine_h

#import "UIColor+HZXColor.h"

///适配暗黑模式   lightColor：白天模式颜色  darkColor：暗黑模式颜色
#define KCustomAdjustColor(lightColor, darkColor) [UIColor colorWithLightColor:lightColor DarkColor:darkColor]

///测试颜色
#define KTestColor [UIColor colorWithLightColorStr:@"226597" DarkColor:@"5ACFB1"]

#endif /* ColorDefine_h */
