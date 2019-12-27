//
//  AppDelegate.m
//  iOS暗黑模式适配
//
//  Created by Apple on 2019/12/27.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MainViewController *VC = [[MainViewController alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:VC];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
