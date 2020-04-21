//
//  AppDelegate.m
//  iOS暗黑模式适配
//
//  Created by Apple on 2019/12/27.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
@interface AppDelegate ()
@property (nonatomic, strong) BaseTabBarController *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _tabBarController = [[BaseTabBarController alloc]init];
    self.window.rootViewController = _tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}





@end
