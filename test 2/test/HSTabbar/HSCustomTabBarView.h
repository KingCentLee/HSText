//
//  HSCustomTabBarView.h
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@protocol HSCustomTabBarViewDelegate

- (BOOL)selectedItemIndex:(long)aIndex;

@end

@interface HSCustomTabBarView : UIView
{
    NSObject <HSCustomTabBarViewDelegate> *delegate;
    long num;
    long		currentSelectedIndex;
    
}
@property (nonatomic,assign)NSObject <HSCustomTabBarViewDelegate> *delegate;
- (id)initWithTitleList:(NSArray *)aTitleList
               iconList:(NSArray *)aIconList
       selectedIconList:(NSArray *)aSelectedIconList;

- (void)updateSelectedItem:(long)aIndex;
- (void)setBadgeValue:(NSString *)aValue
                index:(long)aIndex;

@end
