//
//  HSBaseViewController.m
//  HSStructDemo
//
//  Created by Bee on 15/6/2.
//  Copyright (c) 2015年 Bee. All rights reserved.
//

#import "HSBaseViewController.h"
#import "AppDelegate.h"

@interface HSBaseViewController ()

@end

@implementation HSBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _topDistance = 0;
    long losVersion = [[UIDevice currentDevice].systemVersion floatValue] * 10000;
    if (losVersion >= 70000) {
        _topDistance = 20;
        [self setNeedsStatusBarAppearanceUpdate];
    }
    [self.view setBackgroundColor:UIColorFromRGB(0xf2f2f2)];
    
    [self.navigationItem setBackItemWithTarget:self action:@selector(back:)];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void) setNaviTitle:(NSString *)title{
    [self.navigationItem setNewTitle:title];
}

//子类可重写该方法替代
- (void)back:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
