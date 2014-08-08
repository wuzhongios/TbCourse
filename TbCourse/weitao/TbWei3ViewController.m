//
//  TbWei3ViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-7-31.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "TbWei3ViewController.h"

@interface TbWei3ViewController ()

@end

@implementation TbWei3ViewController

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
    self.title = @"third page";
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(100, 100, 200, 100)];
    label.text = @"third page";
    label.font = [UIFont fontWithName:@"Arial" size:28];
    label.textColor = [UIColor redColor];
    
    [self.view addSubview:label];

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
