//
//  HSCustomTabBarController.h
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSCustomTabBarView.h"

@interface HSCustomTabBarController : UITabBarController<HSCustomTabBarViewDelegate,UITabBarControllerDelegate>
{
    NSArray *theTitleList;
    NSArray *theIconList;
    NSArray *theSelectedIconList;
    HSCustomTabBarView *tabBarView;
}

@property (nonatomic, retain) NSArray *theTitleList;
@property (nonatomic, retain) NSArray *theIconList;
@property (nonatomic, retain) NSArray *theSelectedIconList;
@property (nonatomic, retain) HSCustomTabBarView *tabBarView;

@property (nonatomic, strong) id incomingParams;
@property (nonatomic, strong) id exitParams;
//@property (nonatomic, retain) QuadCurveMenu *menu;

- (void)hideTabBar;
- (void)hideSScustomTab;
- (void)showSScustomTab;
- (BOOL)selectedItemIndex:(long)aIndex;

@end
