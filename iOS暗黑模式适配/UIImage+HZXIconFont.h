//
//  UIImage+HZXIconFont.h
//  iOS暗黑模式适配
//
//  Created by 侯仲祥 on 2020/4/14.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HZXIconFont)


/// 使用字体图标生成图片
/// @param iconCode 字体图标Unicode编码 @"\UXXXXXXXX" 例如@"\U0000e567" 不够八位，前边补零
/// @param size 大小
/// @param color 颜色
+ (UIImage*)imageWithIcon:(NSString*)iconCode size:(NSUInteger)size color:(UIColor*)color;


/// 使用字体图标生成图片
/// @param iconCode iconCode 字体图标Unicode编码 @"\UXXXXXXXX" 例如@"\U0000e567" 不够八位，前边补零
/// @param fontName 字体图标姓名
/// @param size 大小
/// @param color 颜色
+ (UIImage*)imageWithIcon:(NSString*)iconCode inFont:(NSString*)fontName size:(NSUInteger)size color:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
