//
//  TbSearchViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-8-7.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "TbSearchViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "SearchDataCallback.h"
#import "SearchModel.h"
#import "WebviewViewController.h"
#import "ItemTableViewCell.h"
#import "SVPullToRefresh.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TbSearchViewController ()<SearchDataCallback>

@property NSArray* data;
@property SearchModel* model;
@property NSArray* keywords;
@property int index;
@property NSString* keyword;

@end

@implementation TbSearchViewController

//- (id) init{
//    
//    return self;
//}

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
    
    
    CGRect frame = self.view.bounds;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x, 60, frame.size.width, frame.size.height - 80) style:UITableViewStylePlain];
    
    //    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, super.window.frame.size.width, self.window.frame.size.height - 40) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
    
//    UIInputView* input = [[UIInputView alloc] initWithFrame:CGRectMake(10, 10, 100, 20)
//                                             inputViewStyle:UIInputViewStyleDefault];
    
//    [self.navigationItem setTitleView:input];
    
    
    UIBarButtonItem *refreshBtn= [[UIBarButtonItem alloc] initWithTitle:@"refresh" style:UIBarButtonItemStylePlain
                                                                 target:self action:@selector(refresh)];
    
    
//    UIBarButtonItem *backBtn= [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain
//                                                              target:self action:@selector(back)];
    
    
    [self.navigationItem setRightBarButtonItem:refreshBtn];
//    [self.navigationItem setLeftBarButtonItem:backBtn];
    

    self.title = @"search";
    
    __weak TbSearchViewController *weakSelf = self;
    // setup pull-to-refresh
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf updateItems];
    }];
    
    // setup infinite scrolling
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf appendItems];
    }];

    self.keywords = @[@"iphone4s",@"iphone5s",@"xiaomi4",@"mx3",@"nexus5"];
    self.index = 1;
    
//    NSLog(@"hello %@",@"hello");
}

- (void) refresh{
    
    [self.model.items removeAllObjects];
    self.keyword = nil;
    self.index = 1;
    [self  query:[self getKeyword] withIndex:self.index];
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}

- (void) back{
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
//
    [super viewDidAppear:animated];
    
    self.model = [[SearchModel alloc] init];
    self.model.detegate = self;
    
    [self  query:[self getKeyword] withIndex:1];
////
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"http://s.m.taobao.com/search?buying=buyitnow&m=api4h5&from=1&n=20&page=1&q=iphone" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    

}

- (void) query :(NSString*)keyword withIndex: (int) index{
    [self.model query:keyword withIndex:index];
}


- (void)receiveData:(NSArray *)arr{

    self.data = arr;
    
//    NSLog(@"%@",arr);
    
    [self.tableView reloadData];

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(nil == self.data){
        return 0;
    }
    //    NSMutableArray *arr = [self.dict objectForKey:@"items"];
    return [self.data count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(nil == self.data){
        return nil;
    }
    
    //    NSMutableArray *arr = [self.dict objectForKey:@"items"];
    
    NSDictionary *item = [self.data objectAtIndex:indexPath.row];
    
    NSString* title = [item objectForKey:@"name"];
    NSString* price = [item objectForKey:@"price"];
    NSString* img = [item objectForKey:@"img2"];
    
//    NSLog(@" title is %@",title);
    
    
    ItemTableViewCell *cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.textLabel.text = title;
    cell.detailTextLabel.text = price;
    
    //    UIImage* default = [[UIImage alloc] init];
    
    
    [cell.imageView setImageWithURL: [ NSURL URLWithString:img] placeholderImage:[UIImage imageNamed:@"empty.jpg"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WebviewViewController *webview = [[WebviewViewController alloc] init];
    
    NSDictionary *item = [self.data objectAtIndex:indexPath.row];
    
    NSString* url = [ NSString stringWithFormat: @"%@&ttid=6000000@taobao_iphone_5.0", [item objectForKey:@"url"]];
    
    NSLog(@"%@",url);
    
//    url = [NSString alloc] string
    
    
    [webview loadUrl:url];
    
    [self.navigationController pushViewController:webview animated:YES];
    
}

- (void) updateItems{
    [self.model.items removeAllObjects];
    self.keyword = nil;
    self.index = 1;
    [self  query:[self getKeyword] withIndex:self.index];
    [self.tableView.pullToRefreshView stopAnimating];

}

- (void) appendItems{
    [self  query:[self getKeyword] withIndex:++self.index];
    [self.tableView.infiniteScrollingView stopAnimating];
}

- (NSString*) getKeyword{
    
    if(self.keyword){
        return self.keyword;
    }
    
    int i = random() % [self.keywords count];
    NSString* kw = [self.keywords objectAtIndex:i];
    self.keyword = kw;
    return kw;
}

@end
