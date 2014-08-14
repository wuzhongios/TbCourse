//
//  WebviewViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-8-7.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "WebviewViewController.h"

@interface WebviewViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView* webview;

@end

@implementation WebviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init{
    self = [super init];

    if(self){
    
        self.webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
        
        [self.webview setDelegate:self];
        
        [self.view addSubview:self.webview];
        
        
        UIBarButtonItem *refreshBtn= [[UIBarButtonItem alloc] initWithTitle:@"refresh" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(refresh)];
        

        UIBarButtonItem *backBtn= [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(back)];
        

        [self.navigationItem setRightBarButtonItem:refreshBtn];
        [self.navigationItem setLeftBarButtonItem:backBtn];

    }
    return self;
}

- (void) refresh{

    [self.webview reload];

}

- (void) back{
    
    if([self.webview canGoBack]){
    
        [self.webview goBack];
        
    }else{
    
        [self.navigationController popViewControllerAnimated:NO];
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadUrl : (NSString*) url{

    [self.webview loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    
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

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
//    [self.webview stringByEvaluatingJavaScriptFromString:@"alert(1)"];
    
     NSString *theTitle=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];

    self.title = theTitle;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}


- (void)dealloc{
    NSLog(@"delloc");
}

@end
