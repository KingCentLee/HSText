//
//  HSBaseViewController.h
//  HSStructDemo
//
//  Created by Bee on 15/6/2.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSCustomTabBarController.h"
#import "HSNavbar.h"
#import "UIView+Sizes.h"
#import "AppDelegate.h"

#define UI_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define UI_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface HSBaseViewController : UIViewController
{
    
    
}
@property (nonatomic, strong) NSString * naviTitle;
@property (nonatomic, assign) int topDistance;

@end
