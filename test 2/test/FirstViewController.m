//
//  FirstViewController.m
//  test
//
//  Created by Bee on 12/15/15.
//  Copyright (c) 2015 Bee. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    UIScrollView *scrollView;
}

@end

@implementation FirstViewController

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
    scrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, self.view.bounds.size.height)];
    //    contentScrollView.delegate = self;
//    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT + 200);
    
    UILabel *flagLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    flagLabel.text = @"nihao";
    flagLabel.textColor = [UIColor blackColor];
    [scrollView addSubview:flagLabel];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.view.height = UI_SCREEN_HEIGHT;
    
    self.navigationController.navigationBarHidden = YES;
    
    HSCustomTabBarController *cusTomTabarController = [(AppDelegate *)[UIApplication sharedApplication].delegate homeTabBar];
    [cusTomTabarController.tabBarView setFrame:CGRectMake(0, UI_SCREEN_HEIGHT-49, cusTomTabarController.tabBarView.frame.size.width,cusTomTabarController.tabBarView.frame.size.height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
