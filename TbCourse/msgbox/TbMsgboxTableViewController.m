//
//  TbMsgboxTableViewController.m
//  TbCourse
//
//  Created by wuzhong on 14-8-3.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "TbMsgboxTableViewController.h"

@interface TbMsgboxTableViewController ()

@end

@implementation TbMsgboxTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"消息盒子";
        
//        UIBarButtonItem *backButton=[[UIBarButtonItem alloc] initWithCustomView:nil];
//        [self.navigationItem setBackBarButtonItem:backButton];

        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        
        UIBarButtonItem* config = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed:@"navItemConfig"] style: UIBarButtonItemStylePlain target:self action: @selector(openConfig)];
        
        [self.navigationItem setRightBarButtonItem:config];
    }
    
    return self;
}

- (void) openConfig{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
    
    for (int i =1 ;i < 4;i++){
    
        NSMutableArray* arr = [[NSMutableArray alloc] init];
    
        for(int j=0;j<i;j++){
            [arr addObject: [NSString stringWithFormat:@" message at %d / %d" , i,j ]];
        }
        
        [dict setObject: arr forKey: [NSString stringWithFormat: @"msg group %d",i]];
    }
    
    NSLog(@"%@",dict);
    
    self.dataMap = dict;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataMap.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    id values = [self.dataMap allValues][section];
    
    if( [values isKindOfClass: [ NSMutableArray class] ]){
        
        NSMutableArray* arr = values;
        
        return arr.count;
        
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    NSArray *arr = [self.dataMap allValues];
    
    NSArray *values = arr[indexPath.section];
    
    NSString* text = values[indexPath.row];
    
    [cell.textLabel setText:text];
    
//    cell.text = [NSString stringWithFormat:@"index path is %d",indexPath.row];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [self.dataMap allKeys][section];
    
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
