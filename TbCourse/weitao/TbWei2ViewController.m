//
//  TbWei2ViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-7-31.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "TbWei2ViewController.h"
#import "TbWei3ViewController.h"

@interface TbWei2ViewController ()

@end

@implementation TbWei2ViewController

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
    
    self.title = @"second page";
    
    UIBarButtonItem *nextBarButtonItem=[[UIBarButtonItem alloc] initWithTitle: @"next" style: UIBarButtonItemStylePlain target:self action: @selector(next)];
    
    [self.navigationItem setRightBarButtonItem:nextBarButtonItem];
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(100, 100, 200, 100)];
    label.text = @"second page";
    label.font = [UIFont fontWithName:@"Arial" size:28];
    label.textColor = [UIColor redColor];
    
    [self.view addSubview:label];

}

- (void) next{
    
    UIViewController *viewController = [[TbWei3ViewController  alloc] init];
    
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
