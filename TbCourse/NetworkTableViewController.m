//
//  NetworkTableViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-8-7.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "NetworkTableViewController.h"
#import "JSONKit.h"
#import "ItemTableViewCell.h"
#import "WebviewViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NetworkTableViewController ()<NSURLConnectionDataDelegate>

@property (nonatomic,strong) NSMutableData* data;
@property (nonatomic,strong) NSMutableArray* arr;

@end


@implementation NetworkTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    self.title = @"hello network";
    
    if (self) {
//        self.tableView.frame = CGRectMake(100.0f, 100.0f, 100.0f, 100.0f);
        // Custom initialization
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(nil == self.arr){
        return 0;
    }
//    NSMutableArray *arr = [self.dict objectForKey:@"items"];
    return [self.arr count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(nil == self.arr){
        return nil;
    }
    
//    NSMutableArray *arr = [self.dict objectForKey:@"items"];
    
    NSDictionary *item = [self.arr objectAtIndex:indexPath.row];
    
    NSString* title = [item objectForKey:@"name"];
    NSString* price = [item objectForKey:@"price"];
    NSString* img = [item objectForKey:@"img"];
    
    NSLog(@" title is %@",title);

    
    ItemTableViewCell *cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.textLabel.text = title;
    cell.detailTextLabel.text = price;
    
//    UIImage* default = [[UIImage alloc] init];
    
    
    [cell.imageView setImageWithURL: [ NSURL URLWithString:img] placeholderImage:[UIImage imageNamed:@"empty.jpg"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    WebviewViewController *webview = [[WebviewViewController alloc] init];
    
    NSDictionary *item = [self.arr objectAtIndex:indexPath.row];
    
    NSString* url = [item objectForKey:@"url"];
    
    [webview loadUrl:url];
    
    [self.navigationController pushViewController:webview animated:YES];
    

}



- (void) viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://h5.waptest.taobao.com/json/wv/items.json"];
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    
    self.data = [[NSMutableData alloc] init];
    
    self.conn = [[NSURLConnection alloc] initWithRequest: req delegate:self startImmediately:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@" only once %@",response);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    NSLog(@"%@",data);
    
    [self.data appendData:data];

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{

    NSString* str = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    
    NSLog(@"json str is %@",str);
    
    NSDictionary* dict = [str objectFromJSONString];
    
    NSLog(@"json dict is %@", dict);
    
    self.arr = [dict objectForKey:@"items"];
    
    [self.tableView reloadData];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
