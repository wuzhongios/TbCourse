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
#import "BrowserViewController.h"


@interface TbIndexViewController ()

@property NSFileManager *fileManager;

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
    
    [self.navigationItem setRightBarButtonItem:msgboxItem];
    
    self.fileManager = [NSFileManager defaultManager];
    
    [self testBlock];
    
    [self testAsyn];
    
    [self testDataCache];

    
    UILabel *click = [[UILabel alloc] initWithFrame:CGRectMake(50, 340, 200, 50)];
    click.text = @"open browser";
    click.font = [UIFont boldSystemFontOfSize:24];
    click.layer.borderWidth = 2;
    click.textAlignment = NSTextAlignmentCenter;
    click.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openBrowser)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [click addGestureRecognizer:tapGestureRecognizer];
    click.userInteractionEnabled = YES;
    
    [self.view addSubview:click];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 30, 60)];
//    UILabel *lable = [UILabel alloc] initWithFrame:<#(CGRect)#>
//    btn.titleLabel =
    
    
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    
    [self openBrowser];
}

- (void) openBrowser{

    NSLog(@"open browser");
    
    BrowserViewController *browser = [[BrowserViewController alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    
    [self.navigationController pushViewController:browser  animated: NO];

}

- (void) testBlock{
    UILabel *__lable = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    __lable.text = @"hello world";
    
    [self.view addSubview:__lable];
    
    [UIView  animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        __lable.text = @"hellow rold";
    } completion:^(BOOL finished) {
        __lable.text = @"abcd";
    }];
    
    [UIView animateWithDuration:1 //时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionTransitionFlipFromLeft//动画效果
                     animations:^{
                         //动画设置区域
                         //                         __lable.backgroundColor=[UIColor blueColor];
                         __lable.frame=CGRectMake(50, 50, 200, 200);
                         __lable.alpha=0.5;
                         
                     } completion:^(BOOL finish){
                         //动画结束时调用
                         //............
                         //                         __lable.backgroundColor=[UIColor whiteColor];
                         [UIView animateWithDuration:1 //时长
                                               delay:0 //延迟时间
                                             options:UIViewAnimationOptionTransitionFlipFromLeft//动画效果
                                          animations:^{
                                              //动画设置区域
                                              //                         __lable.backgroundColor=[UIColor blueColor];
                                              __lable.frame=CGRectMake(100,100,200,100);
                                              __lable.alpha=1.0;
                                          } completion:^(BOOL finish){
                                              //动画结束时调用
                                              //............
                                              
                                              
                                          }];
                         
                         
                         __lable.frame=CGRectMake(100,100,200,100);
                         __lable.alpha=1.0;
                     }];
}

- (void) testAsyn{
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 300, 100)];
    [self.view addSubview:imageview];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSString *url =@"http://gtms02.alicdn.com/tps/i2/TB1O5UqFVXXXXbWXXXXrVZt0FXX-640-200.jpg";
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
        
//        NSString md5 = [url md5];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *first = [paths objectAtIndex:0];
        
        NSLog(@"current dirct path is %@ , path is %@",[self.fileManager currentDirectoryPath],paths);
        
        NSString *docPath = [first stringByAppendingPathComponent:@"wuzhongcache"];
        
        if([self.fileManager fileExistsAtPath:docPath]){
            
            [self.fileManager removeItemAtPath:docPath error:nil];
            
        }

        [self.fileManager createDirectoryAtPath:docPath withIntermediateDirectories:YES attributes:nil error:nil];
            
//            NSLog(@"%@",docPath);
            NSString* filePath = [docPath stringByAppendingString:@"/test.jpg"];
            [self.fileManager createFileAtPath:filePath contents:data attributes: nil];
            NSLog(@"file path is %@",filePath);
        
        
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            imageview.image = image;
        });
    });
}


- (void) testDataCache{


    

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
