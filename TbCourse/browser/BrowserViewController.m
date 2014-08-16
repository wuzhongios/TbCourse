//
//  BrowserViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-8-15.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "BrowserViewController.h"
#import "BrowserCache.h"

@interface BrowserViewController ()<UIWebViewDelegate>

@property UITextField *addressView;
@property UIWebView *webview;
@property BrowserCache* browserCache;

@end

@implementation BrowserViewController

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
    
    CGSize size = self.view.frame.size;
    
//    UIInputView *addressView = [[UIInputView alloc] initWithFrame:CGRectMake(20,50, 200, 40) inputViewStyle:UIInputViewStyleKeyboard];
//    addressView.backgroundColor = [UIColor grayColor];

    UITextField *addressView = [[UITextField alloc] initWithFrame:CGRectMake(10,30, size.width - 20, 40)];
    addressView.borderStyle = UITextBorderStyleLine ; //UITextBorderStyleRoundedRect;
    addressView.delegate = self;
    addressView.text = @"http://jiawulu.3322.org/";
    [self.view addSubview:addressView];
    
    
    UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 70, size.width , size.height - 130)];
    webview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:webview];
    
    self.addressView = addressView;
    self.webview = webview;
    self.webview.delegate = self;
    
    [self textFieldShouldReturn:addressView];
    
//    self.navigationController toolbar = [UIToolbar alloc] initWithFrame:<#(CGRect)#>
    
    [self addControlBtn:0 withText:@"backward" withSelctor:@selector(back)];
    
    [self addControlBtn:1 withText:@"forward" withSelctor:@selector(forward)];
    
    [self addControlBtn:2 withText:@"refresh" withSelctor:@selector(refresh)];
    
    [self addControlBtn:3 withText:@"rm cache" withSelctor:@selector(removeCache)];
    
//    [UIWebView ]
    self.browserCache  = [[BrowserCache alloc] init];
    [NSURLCache setSharedURLCache:self.browserCache ];
    
}

- (void) addControlBtn : (int) index withText : (NSString *) title withSelctor : (SEL) sel{
    
    CGSize size = self.view.frame.size;

    UILabel *click = [[UILabel alloc] initWithFrame:CGRectMake(20 + 30 * index * 2, size.height - 50, 50, 30)];
    click.text = title;
    click.font = [UIFont boldSystemFontOfSize:9];
    click.layer.borderWidth = 2;
    click.textAlignment = NSTextAlignmentCenter;
    click.layer.borderColor = [UIColor grayColor].CGColor;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [click addGestureRecognizer:tapGestureRecognizer];
    click.userInteractionEnabled = YES;
    
    [self.view addSubview:click];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField == self.addressView){
        
        [textField resignFirstResponder];
        
        NSString* url = self.addressView.text;
        NSLog(@"%@", url);
        
        [self loadUrl:url];

        return YES;
    }else{
        return NO;
    }
}


- (void) loadUrl : (NSString*) url{
    
    if(![url hasPrefix:@"http://"]){
       url =  [@"http://" stringByAppendingString : url ];
    }
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
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


- (void) refresh{
    
    [self.webview reload];
    
}

- (void) removeCache{
    
    [self.browserCache removeAllCachedResponses];
    
}

- (void) back{
    
    if([self.webview canGoBack]){
        
        [self.webview goBack];
        
    }else{
        
        [self.navigationController popViewControllerAnimated:NO];
        
    }
    
}

- (void) forward{
    
    if([self.webview canGoForward]){
        
        [self.webview goForward];
        
    }
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //    [self.webview stringByEvaluatingJavaScriptFromString:@"alert(1)"];
    //    NSString *location=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    NSString *location = [[[webView request] URL] absoluteString] ;
    NSLog(@"location is %@",location);
    
    if([location length] > 0 ){
        self.addressView.text = location;
    }
}



- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSString *location = [[[webView request] URL] absoluteString] ;
    NSLog(@"location is error %@",location);


}

@end
