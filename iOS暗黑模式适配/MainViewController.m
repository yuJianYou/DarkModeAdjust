//
//  MainViewController.m
//  iOS暗黑模式适配
//
//  Created by Apple on 2019/12/27.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "MainViewController.h"
#import "UIColor+HZXColor.h"
#import "ColorDefine.h"
#import "UIImage+HZXIconFont.h"
@interface MainViewController ()
//颜色自定的label
@property (weak, nonatomic) IBOutlet UILabel *customColorLabel;
//用颜色集合定义的Label
@property (weak, nonatomic) IBOutlet UILabel *colorSetLabel;
///图片适配
@property (weak, nonatomic) IBOutlet UIImageView *appleImageView;
///layer层的颜色适配
@property (weak, nonatomic) IBOutlet UILabel *layerLabel;

/// 字体图标label
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

/// 字体图标Image
@property (weak, nonatomic) IBOutlet UIImageView *centerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *homeImageView;

@property (weak, nonatomic) IBOutlet UIImageView *greenHomeImageView;

@end

@implementation MainViewController

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    #warning ⚠️⚠️⚠️⚠️⚠️⚠️⚠️ 这里我们需要特别注意 当模式发生变化的时候 只有在以下情况下才能监听模式发生了变化
    /**
     *第一：在UIView中 以下四个方法
     *draw();  layoutSubview();  traitCollectionDidChange();   tintColorDidChange()
     *
     *第二：在UIViewController中 以下三个方法中
     *viewWillLayoutSubviews();   viewDidLayoutSubviews() ;     traitCollectionDidChange()
     *
     *第三：UIPresentationController  以下三个方法
     *containerViewWillLayoutSubviews()；    containerViewDidLayoutSubviews()； traitCollectionDidChange()
     */
    
    ///获取当前系统模
    if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        self.navigationItem.title = @"iOS13 暗黑模式";
    }else{
        self.navigationItem.title = @"iOS13 普通模式";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色 这里我用的是系统提供给我们的颜色
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    ///这里用宏定义给label背景赋值
    self.customColorLabel.textColor = KCustomAdjustColor([UIColor redColor], [UIColor yellowColor]);
    
    //这里用对UIColor的类别给label背景赋值
    self.customColorLabel.backgroundColor = [UIColor colorWithLightColorStr:@"226597" DarkColor:@"5ACFB1"] ;
    
    ///用ColorSet 跟UIImage使用是类似的  把自定义的颜色名字写入就行了
    self.colorSetLabel.textColor = [UIColor colorNamed:@"customBlueColor"];
    
    //图片适配
    self.appleImageView.image = [UIImage imageNamed:@"icon01"];
    
    /**
     *CGColor适配
     *iOS13后，UIColor能够表示动态颜色，但是CGColor依然只能表示一种颜色。所以对于CALayer对象只能在traitCollectionDidChange方法中进行改变
     *给一个默认的边框颜色
    */
    self.layerLabel.layer.borderWidth = 1;
    
    
    /// 以下两个属性可以使用测试字体图标 有了字体图标  图标也可以按照我们想要的颜色进行改变，也不需要重新导入新图片
    self.textLabel.font = [UIFont fontWithName:@"iconfont" size:15];
    self.textLabel.text = @"这段文字可以添加图片哟 \U0000e637";
    self.textLabel.textColor = [UIColor colorWithLightColorStr:@"226597" DarkColor:@"FF0000"];
    
    /// 有了字体图标  图标也可以按照我们想要的颜色进行改变，也不需要重新导入新图片
    self.homeImageView.image = [UIImage imageWithIcon:@"\U0000e637" inFont:@"iconfont" size:40 color:[UIColor colorWithLightColorStr:@"226597" DarkColor:@"FF0000"]];
    /// 这样的话如果我们换了图标颜色就不用让美工伴我们切图了，直接修改颜色即可
    self.greenHomeImageView.image = [UIImage imageWithIcon:@"\U0000e637" inFont:@"iconfont" size:40 color:[UIColor greenColor]];
    
    self.centerImageView.image = [UIImage imageWithIcon:@"\U0000e608" size:40 color:KTestColor];
    
    
    
}

/// 重写这个方法就会改变当前页面的模式
//- (UIUserInterfaceStyle)overrideUserInterfaceStyle{
//    return UIUserInterfaceStyleLight;
//}


/// 模式改变的回调代理
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    /**
     *CGColor适配
     *iOS13后，UIColor能够表示动态颜色，但是CGColor依然只能表示一种颜色。所以对于CALayer对象只能在traitCollectionDidChange方法中进行改变
    */
    self.layerLabel.layer.borderColor = KTestColor.CGColor;
    
    self.centerImageView.image = [UIImage imageWithIcon:@"\U0000e608" size:40 color:KTestColor];
    if (@available(iOS 13.0, *)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                NSLog(@"************* iOS13 暗黑模式");
            }else{
                NSLog(@"############# iOS13 普通模式");
            }
        }
        
    }
}
@end
