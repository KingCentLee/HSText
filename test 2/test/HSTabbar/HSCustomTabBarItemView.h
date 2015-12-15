//
//  HSCustomTabBarItemView.h
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@class HSUIBadgeView;

@interface HSCustomTabBarItemView : UIButton
{
    UILabel		*titleLabel;
    UIImageView	*imageView;
    UIImage		*iconImage;
    UIImage		*selectedIconImage;
    HSUIBadgeView *badgeView;
    NSString    *badgeValue;
    UIImageView *selectedImageView;
    
}
@property (nonatomic,retain)UILabel		*titleLabel;
@property (nonatomic,retain)UIImageView	*imageView;
@property (nonatomic,retain)UIImage		*iconImage;
@property (nonatomic,retain)UIImage		*selectedIconImage;
@property (nonatomic,retain)HSUIBadgeView *badgeView;
@property (nonatomic,retain)NSString    *badgeValue;
@property (nonatomic,retain)UIImageView	*selectedImageView;

- (id)initWithFrame:(CGRect)frame
              title:(NSString *)aTitle
              image:(UIImage *)aImage
         hightImage:(UIImage *)ahightImage;

- (id)initWithFrame1:(CGRect)frame
               title:(NSString *)aTitle
               image:(UIImage *)aImage
          hightImage:(UIImage *)ahightImage;

- (void)selectState:(BOOL)aState;
- (void)setBadgeValue:(NSString *)aValue;

-(void)setBadgeImageView:(NSString *)aValue;

@end
