# DarkModeAdjust
iOS暗黑模式开发版，看了这个，直接上手适配
### 效果图 
![效果图](https://upload-images.jianshu.io/upload_images/16265162-ff3b139323cbb263.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 颜色适配
iOS13之后苹果将**UIColor**改变成了动态颜色，**UIColor**会根据不同模式来改变不同的颜色。苹果提供给我们了一些系统颜色。这些颜色请参考**UIIntercace.h**这个类。然而我们更在意的是我们自定义的颜色。系统给我们提供了两个方法
```
+ (UIColor *)colorWithDynamicProvider:(UIColor * (^)(UITraitCollection *))dynamicProvider;
- (UIColor *)initWithDynamicProvider:(UIColor * (^)(UITraitCollection *))dynamicProvider;
```
接下来是我自己对**UIColor**进行的category，这里提供了一些设置颜色的方法
```objectivec
/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color;

/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/// 适配暗黑模式颜色   传入的UIColor对象
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)colorWithLightColor:(UIColor *)lightColor DarkColor:(UIColor *)darkColor;

/// 适配暗黑模式颜色   颜色传入的是16进制字符串
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)colorWithLightColorStr:(NSString *)lightColor DarkColor:(NSString *)darkColor;

/// 适配暗黑模式颜色   颜色传入的是16进制字符串 还有颜色的透明度
/// @param lightColor 普通模式颜色
/// @param lightAlpha 普通模式颜色透明度
/// @param darkColor 暗黑模式颜色透明度
/// @param darkAlpha 暗黑模式颜色
+ (UIColor *)colorWithLightColorStr:(NSString *)lightColor WithLightColorAlpha:(CGFloat)lightAlpha DarkColor:(NSString *)darkColor WithDarkColorAlpha:(CGFloat)darkAlpha;
```
具体用法如下：
```
//只需在给颜色赋值的时候指定不同模式下的颜色即可
self.customColorLabel.backgroundColor = [UIColor colorWithLightColorStr:@"226597" DarkColor:@"5ACFB1"] ;
```
#### Color Set 的使用
对于使用xib的童鞋来说，我们就只能使用color set颜色集了。首先创建一个颜色集合![color set](https://upload-images.jianshu.io/upload_images/16265162-e4e8ae69f423d432.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
接下来选择Appearance选项中的Any,Dark模式就会出现两个模式，我们设置这两个模式的颜色值，使用的时候直接使用我们自定义的颜色名称(customBlueColor)就可以了

![Snipaste_2020-01-01_19-55-43.png](https://upload-images.jianshu.io/upload_images/16265162-36c7743ffa4a1ff6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
使用方法：
```
///用ColorSet 跟UIImage使用是类似的  把自定义的颜色名字写入就行了
self.colorSetLabel.textColor = [UIColor colorNamed:@"customBlueColor"];
```
### Layer层面上的Color适配
iOS13中UIColor是动态变化的，但是对于CGColr,CALayer层面上的Color来说，还是只是单一颜色,我们只能在模式变化的时候的监听方法中适配。不过我们可以参考[XYColor](https://github.com/RayJiang16/XYColor.git)
```
/// 模式改变的回调代理
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    /**
     *CGColor适配
     *iOS13后，UIColor能够表示动态颜色，但是CGColor依然只能表示一种颜色。所以对于CALayer对象只能在traitCollectionDidChange方法中进行改变
    */
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            //修改label的边框色
            self.layerLabel.layer.borderColor = KTestColor.CGColor;
            if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                NSLog(@"************* iOS13 暗黑模式");
            }else{
                NSLog(@"############# iOS13 普通模式");
            }
        }
    }
}
```
### 图片适配
其实图片适配跟**Color Set**设置是一样
![图片适配](https://upload-images.jianshu.io/upload_images/16265162-f3af13ab4f1e633e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
使用方法：
```
//图片适配
self.appleImageView.image = [UIImage imageNamed:@"icon01"];
```
至此，我们的适配已经结束。以上有什么不对的地方欢迎各位童鞋的指正，我们一起讨论。大家加油！！！

