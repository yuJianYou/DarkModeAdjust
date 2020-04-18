//
//  UIImage+HZXIconFont.m
//  iOS暗黑模式适配
//
//  Created by 侯仲祥 on 2020/4/14.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UIImage+HZXIconFont.h"

@implementation UIImage (HZXIconFont)
+ (UIImage*)imageWithIcon:(NSString*)iconCode size:(NSUInteger)size color:(UIColor*)color {
    return [UIImage imageWithIcon:iconCode inFont:@"iconfont" size:size color:color];
}
+ (UIImage*)imageWithIcon:(NSString*)iconCode inFont:(NSString*)fontName size:(NSUInteger)size color:(UIColor*)color {
    CGSize imageSize = CGSizeMake(size, size);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [[UIScreen mainScreen] scale]);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    label.font = [UIFont fontWithName:fontName size:size];
    label.text = iconCode;
    if(color){
        label.textColor = color;
    }
    [label.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    return retImage;
}
@end
