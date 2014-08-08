//
//  TbIndexViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-8-2.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "TbIndexViewController.h"
#import "Image+Label.h"
#import "TbMsgboxTableViewController.h"
#import "NetworkTableViewController.h"


@interface TbIndexViewController ()

@end

@implementation TbIndexViewController

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
    self.title = @"Index";
    
    Image_Label *imgLable = [[Image_Label alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    [imgLable initWithImg: @"iconfont-message" andLable:@"msg"];
    
    UIBarButtonItem *msgboxItem=[[UIBarButtonItem alloc] initWithCustomView:imgLable];
    
    [imgLable addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openMsgBox)]];
    
    
    
//    UIBarButtonItem *leftBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(clickView:)];

//

//    [imgLable addTarget:self action:@selector(openMsgBox:) forControlEvents:UIControlEventTouchDown];

//    msgboxItem add
    
    [self.navigationItem setRightBarButtonItem:msgboxItem];
    

}

- (void) openMsgBox{

    NSLog(@"open msg box ");
    
    [self.navigationController pushViewController:[[TbMsgboxTableViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
    
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
