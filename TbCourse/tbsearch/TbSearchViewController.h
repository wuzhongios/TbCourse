//
//  TbSearchViewController.h
//  TbCourse
//
//  Created by wuzhong on 14-8-7.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TbSearchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
