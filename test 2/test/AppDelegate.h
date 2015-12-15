//
//  AppDelegate.h
//  test
//
//  Created by Bee on 12/15/15.
//  Copyright (c) 2015 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSCustomTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//主流程 从Login -> homeTabBar -> 中间按钮所产生的navigaion flow
@property (strong, nonatomic) UINavigationController *mainNavigationVC;
//主界面的TABBAR
@property (strong, nonatomic) HSCustomTabBarController *homeTabBar;

@property (assign,nonatomic) BOOL forceUpdate;

- (HSCustomTabBarController *)getNewTabAction;

@end
