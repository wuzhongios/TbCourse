//
//  TbWeitaoViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-7-31.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "TbWeitaoViewController.h"
#import "TbWei2ViewController.h"

@interface TbWeitaoViewController ()

@end

@implementation TbWeitaoViewController

static int count = 0;

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
    
//    NSDate *nowDate = [NSDate date];
    
    self.title =  [NSString stringWithFormat:@"weitao %d",count];
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(100, 100, 200, 100)];
    label.text = @"first page";
    label.font = [UIFont fontWithName:@"Arial" size:28];
    label.textColor = [UIColor redColor];
    
    [self.view addSubview:label];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame: CGRectMake(100, 300, 100, 50)];

    [self.view addSubview: btn];

//    btn.backgroundColor = [UIColor grayColor];

//    btn.titleLabel.text = @"push";
    [btn setTitle:[NSString stringWithFormat:@"push %d",count++] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    btn.titleLabel.textColor = [UIColor redColor];

    [btn addTarget:self action:@selector(popWindow) forControlEvents:(UIControlEventAllTouchEvents)];

    
    
    UIBarButtonItem *nextBarButtonItem=[[UIBarButtonItem alloc] initWithTitle: @"next" style: UIBarButtonItemStylePlain target:self action: @selector(next)];
    
    [self.navigationItem setRightBarButtonItem:nextBarButtonItem];
    
//    UISegmentedControl *segementControl=[[UISegmentedControl alloc] initWithItems:@[@"测试1",@"测试2"]];
//    
//    
//    UIBarButtonItem *rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:segementControl];
//    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    
    
    count++;
    
}

- (void) popWindow{
    TbWeitaoViewController * viewController = [[TbWeitaoViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) next{
    
    UIViewController *viewController = [[TbWei2ViewController  alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
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
