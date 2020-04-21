//
//  BaseTabBarController.m
//  iOS暗黑模式适配
//
//  Created by 侯仲祥 on 2020/4/21.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "BaseTabBarController.h"
#import "MainViewController.h"
#import "UIColor+HZXColor.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addControllers];
}
/// 创建tabBar选项
- (void)addControllers{
    [self addNavigationController:[[MainViewController alloc] init] title:@"通讯录" defaultImageName:@"tongxunlu_" selectedImageName:@"tongxunlu2_"];
}
/// 创建导航视图方法
- (void)addNavigationController:(UIViewController *)rootVC title:(NSString *)title defaultImageName:(NSString *)defaultImagename selectedImageName:(NSString *)selectedImageName {
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:defaultImagename]  selectedImage:[UIImage imageNamed:selectedImageName]];
    [self configTabbarItem:tabBarItem];

    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:rootVC];
    naviVC.tabBarItem = tabBarItem;
    [self addChildViewController:naviVC];
}
- (void)configTabbarItem:(UITabBarItem *)tabbarItem {
    [tabbarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    [tabbarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    [UIFont boldSystemFontOfSize:12],
    NSFontAttributeName,[UIColor colorWithHexString:@"777777"],NSForegroundColorAttributeName,
    nil] forState:UIControlStateNormal];
    
    [tabbarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    [UIFont boldSystemFontOfSize:12],
    NSFontAttributeName,[UIColor colorWithHexString:@"1CACEA"],NSForegroundColorAttributeName,
    nil] forState:UIControlStateNormal];
}

#pragma mark ----------------- 适配tabBarItem图片
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
        [self changeTabBarItemImage:self.childViewControllers[0] defaultImage:[UIImage imageNamed:@"tongxunlu_"] selectImage:[UIImage imageNamed:@"tongxunlu2_"]];
    }
}

- (void)changeTabBarItemImage:(UIViewController *)VC defaultImage:(UIImage *)defaultImage selectImage:(UIImage *)selectImage {
    VC.tabBarItem.image = defaultImage;
    VC.tabBarItem.selectedImage = selectImage;
}
@end
