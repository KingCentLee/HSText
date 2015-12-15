//
//  SecondViewController.m
//  test
//
//  Created by Bee on 12/15/15.
//  Copyright (c) 2015 Bee. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *dictionArr;
@property (nonatomic, retain) UITableView *dynamicMsgTableView;

@end

@implementation SecondViewController

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
    self.navigationItem.title = @"动态";
    self.dictionArr = [NSMutableArray array];
    
    self.dynamicMsgTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 , self.view.width, self.view.bounds.size.height - 50 - 44 - 20)];
    if (IOS_VERSION < 7) {
        self.dynamicMsgTableView.height = self.view.bounds.size.height - 50 - 44;
    }
    self.dynamicMsgTableView.backgroundColor = [UIColor blueColor];
//    self.dynamicMsgTableView.separatorStyle = NO;
    self.dynamicMsgTableView.backgroundColor = UIColorFromRGB(0xf5f5f5);
    self.dynamicMsgTableView.contentSize = CGSizeMake(self.view.width, self.view.bounds.size.height + 200);
    self.dynamicMsgTableView.delegate = self;
    self.dynamicMsgTableView.dataSource = self;
    [self.view addSubview:self.dynamicMsgTableView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBarHidden = NO;
    
    HSCustomTabBarController *cusTomTabarController = [(AppDelegate *)[UIApplication sharedApplication].delegate homeTabBar];
    [cusTomTabarController.tabBarView setFrame:CGRectMake(0, UI_SCREEN_HEIGHT-49, cusTomTabarController.tabBarView.frame.size.width,cusTomTabarController.tabBarView.frame.size.height)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HSDynamicMsgTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //    [[cell viewWithTag:101] removeFromSuperview];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = @"nihao";
    
    return cell;
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
