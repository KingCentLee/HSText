//
//  HSCustomTabBarItemView.m
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import "HSCustomTabBarItemView.h"
//#import "HSUtils.h"

@implementation HSCustomTabBarItemView

@synthesize titleLabel;
@synthesize imageView;

@synthesize iconImage;
@synthesize selectedIconImage;
@synthesize badgeView;
@synthesize badgeValue;
@synthesize selectedImageView;

- (id)initWithFrame:(CGRect)frame
              title:(NSString *)aTitle
              image:(UIImage *)aImage
         hightImage:(UIImage *)ahightImage
{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        self.iconImage			= aImage;
        self.selectedIconImage	= ahightImage;
        // Initialization code.
        selectedImageView                   = nil;
        
        imageView					= [[UIImageView alloc] initWithFrame:CGRectMake( 18, 8, 25, 22)];
        imageView.backgroundColor	= [UIColor clearColor];
        imageView.image				= self.iconImage;
        [self addSubview:imageView];
        
        titleLabel					= [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 20, frame.size.width, 20)];
        titleLabel.textAlignment	= NSTextAlignmentCenter;
        titleLabel.text				= aTitle;
        titleLabel.numberOfLines	= 0;
        titleLabel.font				= [UIFont systemFontOfSize:10];
        titleLabel.backgroundColor	= [UIColor clearColor];
        titleLabel.textColor		= [UIColor whiteColor];
        [self addSubview:titleLabel];
        
//        badgeView = [[HSUIBadgeView alloc] initWithFrame:CGRectMake(frame.size.width/2, 0, 30, 20)];
//        badgeView.badgeString = nil;
//        badgeView.badgeColor = [UIColor redColor];
        
    }
    return self;
}

- (id)initWithFrame1:(CGRect)frame
               title:(NSString *)aTitle
               image:(UIImage *)aImage
          hightImage:(UIImage *)ahightImage{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        self.iconImage			= aImage;
        self.selectedIconImage	= ahightImage;
        // Initialization code.
        selectedImageView                   = nil;
        
        imageView					= [[UIImageView alloc] initWithFrame:CGRectMake( 1.0f, 3, 59, 59)]; //这里调节中间BUTTON的位置，2边对牢，搜一下
        imageView.backgroundColor	= [UIColor clearColor];
        imageView.image				= self.iconImage;
        [self addSubview:imageView];
        
        titleLabel					= [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 23, frame.size.width, 20)];
        titleLabel.textAlignment	= NSTextAlignmentCenter;
        titleLabel.text				= aTitle;
        titleLabel.numberOfLines	= 0;
        titleLabel.font				= [UIFont systemFontOfSize:10];
        titleLabel.backgroundColor	= [UIColor clearColor];
        titleLabel.textColor		= [UIColor whiteColor];
        [self addSubview:titleLabel];
        
//        badgeView = [[HSUIBadgeView alloc] initWithFrame:CGRectMake(frame.size.width/2, 0, 30, 20)];
//        badgeView.badgeString = nil;
//        badgeView.badgeColor = [UIColor redColor];
        
    }
    return self;
}

- (void)setBadgeValue:(NSString *)aValue
{
    if (aValue == nil)
    {
        [badgeView removeFromSuperview];
    }
    else
    {
        [self addSubview:badgeView];
        [badgeView setBadgeString:aValue];
    }
}

//show icon_new_num 2012-09-25
-(void)setBadgeImageView:(NSString *)aValue{
    
    UIView *oldBadgeImageView = (UIImageView *)[self viewWithTag:99];
    if (oldBadgeImageView) {
        [oldBadgeImageView removeFromSuperview];
    }
    
    //    if (aValue && [aValue length] > 0) {
    //        UIImageView *newBadgeImageView = [PCommonUtil generateBadgeImageView:[aValue intValue]];
    //        [newBadgeImageView setTag:99];
    //        [self addSubview:newBadgeImageView];
    //    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code.
 }
 */

- (void)selectState:(BOOL)aState
{
    if (aState)
    {
        //        selectedImageView.hidden = NO;
        imageView.image = self.selectedIconImage;
        titleLabel.textColor = UIColorFromRGB(0xfa3131);
    }
    else {
        //        selectedImageView.hidden = YES;
        imageView.image	= self.iconImage;
        titleLabel.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1];
    }
    
}

- (void)dealloc {
    
    [badgeValue         release];
    [badgeView          release];
    [iconImage			release];
    [selectedIconImage	release];
    
    [titleLabel			release];
    [imageView			release];
    [selectedImageView	release];
    
    [super dealloc];
}

@end
