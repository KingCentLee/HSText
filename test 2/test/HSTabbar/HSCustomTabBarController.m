//
//  HSCustomTabBarController.m
//  HSStructDemo
//
//  Created by Bee on 15/6/1.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import "HSCustomTabBarController.h"
#import "AppDelegate.h"
#import "HSNavbar.h"
//#import "HSSegmentBar.h"


@interface HSCustomTabBarController ()

@end

@implementation HSCustomTabBarController

{
//    HSSegmentBar *segmentBar;
    float radius;
    float bubbleRadius;
    
}
@synthesize theTitleList,theIconList,theSelectedIconList,tabBarView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

-(void) viewWillDisappear:(BOOL)animated
{
//    _menu.hidden = YES;
    [super viewWillDisappear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.delegate = self; //自设 UITabBarControllerDelegate
    
    radius = 144;
    bubbleRadius = 25;
    theTitleList = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    theIconList = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    theSelectedIconList = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    tabBarView = [[HSCustomTabBarView alloc] initWithTitleList:theTitleList iconList:theIconList selectedIconList:theSelectedIconList];
    tabBarView.delegate = self;
    
    tabBarView.frame = CGRectMake(0, self.tabBarController.tabBar.frame.origin.y-8,tabBarView.frame.size.width,tabBarView.frame.size.height);
    
    tabBarView.backgroundColor	= [UIColor clearColor];
    [self.view addSubview:tabBarView];
    
}


- (BOOL)selectedItemIndex:(long)aIndex{
    
    self.selectedIndex = aIndex;
    NSArray *naviTitleArray = [NSArray arrayWithObjects:@"",@"第二页",@"第三页",@"",@"第四页",nil];
    self.navigationItem.title = [naviTitleArray objectAtIndex:aIndex];
    
    return YES;
    
}


-(void)hideSScustomTab{
    
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[HSCustomTabBarView class]])
        {
            view.hidden = YES;
            break;
        }
    }
    
}

-(void)showSScustomTab{
    
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[HSCustomTabBarView class]])
        {
            view.hidden = NO;
            break;
        }
    }
    
}

- (void)hideTabBar
{
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            view.hidden = YES;
            break;
        }
    }
}


-(void)dealloc{
//    [_menu release];
    [tabBarView release];
    [super dealloc];
}

@end
