//
//  HSCustomTabBarView.m
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import "HSCustomTabBarView.h"
#import "HSCustomTabBarView.h"
#import "HSCustomTabBarItemView.h"
#import "UIImage+HSImageCategory.h"
#import "NSString+HSStringCategory.h"

#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT 49.0f

@implementation HSCustomTabBarView

@synthesize delegate;


- (void)selectedItem:(id)sender
{
    HSCustomTabBarItemView *theButton = (HSCustomTabBarItemView *)sender;
    int selectedIndex = theButton.tag - 100;
    
    if ([delegate respondsToSelector:@selector(selectedItemIndex:)])
    {
        BOOL isYES = [delegate selectedItemIndex:selectedIndex];
        if (isYES)
        {
            [self updateSelectedItem:selectedIndex];
        }
    }
}

- (id)initWithTitleList:(NSArray *)aTitleList
               iconList:(NSArray *)aIconList
       selectedIconList:(NSArray *)aSelectedIconList
{
    self = [super initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    if (self)
    {
        // Initialization code.
        num	= [aTitleList count];
        currentSelectedIndex	= 0;
        
        UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        backImageView.backgroundColor	= UIColorFromRGB(0xf8f8f8); //ecf4ff
//        backImageView.image				= [UIImage imageWithName:@"menu_bg"
//                                                   type:@"png"
//                                           liftCapWidth:0
//                                           topCapHeight:0];
        
        [self addSubview:backImageView];
        [backImageView release];
        
        long theNum = [aTitleList count];
        if (theNum > 5)
            theNum = 5;
        
        self.alpha	= 1;
        int width = WIDTH / theNum;
        for (int i=0; i< theNum; i++)
        {
            NSString *theTitle						= [aTitleList objectAtIndex:i];
            NSString *theImageString				= [aIconList objectAtIndex:i];
            UIImage *theImage						= [UIImage imageWithName:[theImageString getImageName]
                                                       type:[theImageString getImageType]];
            NSString *selectedString						= [aSelectedIconList objectAtIndex:i];
            UIImage *theSelectedImage				= [UIImage imageWithName:[selectedString getImageName]
                                                             type:[selectedString getImageType]];
            HSCustomTabBarItemView *tabBarItemView = nil;
//            if (i == 2) {
//                tabBarItemView	= [[HSCustomTabBarItemView alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-theImage.size.width)/2-3, 0, 74, HEIGHT)
//                                                                          title:theTitle
//                                                                          image:theImage
//                                                                     hightImage:theSelectedImage];
//                
//            }else {
                tabBarItemView	= [[HSCustomTabBarItemView alloc] initWithFrame:CGRectMake((width-123/2)/2 + i*width, 0, 123/2, HEIGHT)
                                                                         title:theTitle
                                                                         image:theImage
                                                                    hightImage:theSelectedImage];
//            }
            
            
            
            if (i == 0)
            {
                [tabBarItemView selectState:YES];
            }
            else{
                
                [tabBarItemView selectState:NO];
                
            }
            
            tabBarItemView.tag						= i + 100;
            [tabBarItemView addTarget:self
                               action:@selector(selectedItem:)
                     forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:tabBarItemView];
            [tabBarItemView release];
        }
    }
    return self;
}

- (void)dealloc {
    delegate	= nil;
    [super dealloc];
}

- (void)setBadgeValue:(NSString *)aValue
                index:(long)aIndex
{
    if ([[self viewWithTag:aIndex + 100] isKindOfClass:[HSCustomTabBarItemView class]])
    {
        HSCustomTabBarItemView *theView1 = (HSCustomTabBarItemView *)[self viewWithTag:aIndex + 100];
        //        [theView1 setBadgeValue:aValue];
        
        //show icon_new_num 2012-09-25
        [theView1 setBadgeImageView:aValue];
    }
}

- (void)updateSelectedItem:(long)aIndex
{
    HSCustomTabBarItemView *theView = (HSCustomTabBarItemView *)[self viewWithTag:currentSelectedIndex + 100];
    [theView selectState:NO];
    
    HSCustomTabBarItemView *theView1 = (HSCustomTabBarItemView *)[self viewWithTag:aIndex + 100];
    [theView1 selectState:YES];
    
    currentSelectedIndex	= aIndex;
    
    //setBadgeValue add by zhuruhong 20120920
    [self setBadgeValue:nil index:aIndex];
    
}

@end
