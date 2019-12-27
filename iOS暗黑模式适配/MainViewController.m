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
@interface MainViewController ()
//颜色自定的label
@property (weak, nonatomic) IBOutlet UILabel *customColorLabel;
//用颜色集合定义的Label
@property (weak, nonatomic) IBOutlet UILabel *colorSetLabel;

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
    self.customColorLabel.textColor = KCustomAdjustColor([UIColor greenColor], [UIColor yellowColor]);
    //这里用对UIColor的类别给label背景赋值
    self.customColorLabel.backgroundColor = [UIColor colorWithLightColorStr:@"226597" DarkColor:@"5ACFB1"] ;
    ///用ColorSet 跟UIImage使用是类似的  把自定义的颜色名字写入就行了
    self.colorSetLabel.textColor = [UIColor colorNamed:@"customBlueColor"];
    
    
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        NSLog(@"************* iOS13 暗黑模式");
    }else{
        NSLog(@"$$$$$$$$$$$$$ iOS13 普通模式");
    }
}
@end
