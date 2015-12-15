//
//  HSNavbar.h
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#define SysNavbarHeight 44

#define DefaultStateBarColor  UIColorFromRGB(0x333333)  //UIColorFromRGB(0x215caa)     //[UIColor blackColor]
#define DefaultStateBarSytle UIBarStyleBlackOpaque

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#import <UIKit/UIKit.h>


@interface HSNavbar : UINavigationBar

/**< 适用于ios7*/
@property (nonatomic,strong)UIColor *stateBarColor;/**< 默认black*/
@property (nonatomic,assign)UIBarStyle cusBarStyele;/**< 默认UIBarStyleBlackOpaque*/

- (void)setDefault;


@end




/**
 * @brief 自定义barbuttonitem
 *
 * @param
 * @return
 */

#define TitleFont 18
#define TitleColor UIColorFromRGB(0xffffff)

#define BackgroundImage @"top.png"
#define BackItemImage @"pos_fanhui.png"
#define ItemImage @"bar_button_item.png"
#define BackItemSelectedImage @"pos_fanhui.png"
#define ItemSelectedImage @"bar_button_item_s.png"

#define BackItemOffset UIEdgeInsetsMake(0, 5, 0, 0)
#define ItemLeftMargin 10
#define ItemWidth 23
#define ItemHeight 23
#define ItemTextFont 12
#define ItemTextNormalColot [UIColor whiteColor]
#define ItemTextSelectedColot [UIColor colorWithWhite:0.7 alpha:1]


typedef enum {
    
    NavBarButtonItemTypeDefault = 0,
    NavBarButtonItemTypeBack = 1
    
}NavBarButtonItemType;


@interface NavBarButtonItem : NSObject

@property (nonatomic,assign)NavBarButtonItemType itemType;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *image;
@property (nonatomic,strong)UIFont *font;
@property (nonatomic,strong)UIColor *normalColor;
@property (nonatomic,strong)UIColor *selectedColor;
@property (nonatomic,weak)id target;
@property (nonatomic,assign)SEL selector;
@property (nonatomic,assign)BOOL highlightedWhileSwitch;

- (id)initWithType:(NavBarButtonItemType)itemType;

+ (id)defauleItemWithTarget:(id)target
                     action:(SEL)action
                      title:(NSString *)title;
+ (id)defauleItemWithTarget:(id)target
                     action:(SEL)action
                      image:(NSString *)image;
+ (id)backItemWithTarget:(id)target
                  action:(SEL)action
                   title:(NSString *)title;

- (void)setTarget:(id)target withAction:(SEL)action;


@end


@interface UINavigationItem (CustomBarButtonItem)

//pos用到的
- (void)setNewTitle:(NSString *)title;
-(void)setLogoImageTitle:(NSString *)title;


- (void)setNewTitleImageTitle:(UIImage *)image title:(NSString *)title;

- (void)setNewTitleImage:(UIImage *)image;

- (void)setLeftItemWithTarget:(id)target
                       action:(SEL)action
                        title:(NSString *)title;
- (void)setLeftItemWithTarget:(id)target
                       action:(SEL)action
                        image:(NSString *)image;


//pos用到的
- (void)setLeftItemWithTarget:(id)target
                       action:(SEL)action
                     backType:(id) obj;
- (void)setLeftItemWithTarget:(id)target
                       action:(SEL)action
                    closeType:(id) obj;

- (void)setCenterItemWithTarget:(id)target
                         action:(SEL)action
                       backType:(id) obj withTitle:(NSString *)title;


- (void)setLeftItemWithButtonItem:(NavBarButtonItem *)item;



- (void)setRightItemWithTarget:(id)target
                        action:(SEL)action
                         title:(NSString *)title;
- (void)setRightItemWithTarget:(id)target
                        action:(SEL)action
                         image:(NSString *)image;
- (void)setRightItemWithButtonItem:(NavBarButtonItem *)item;

//pos用到的
- (void)setBackItemNone;

- (void)setBackItemWithTarget:(id)target
                       action:(SEL)action;
- (void)setBackItemWithTarget:(id)target
                       action:(SEL)action
                        title:(NSString *)title;


//订制按钮
- (void)setExitLeftItemWithTarget:(id)target
                           action:(SEL)action
                            image:(NSString *)image;

@end
