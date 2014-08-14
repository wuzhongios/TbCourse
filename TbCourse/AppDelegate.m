//
//  WzAppDelegate.m
//  wuzhong_tbfav
//
//  Created by wuzhong on 14-7-24.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "AppDelegate.h"
#import "TbFavouriteViewController.h"
#import "TbWeitaoViewController.h"
#import "TbIndexViewController.h"
#import "TbMsgboxTableViewController.h"
#import "NetworkTableViewController.h"
#import "tbsearch/TbSearchViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UITabBarController *tabController = [[UITabBarController alloc] init ];
    
    [self.window setRootViewController:tabController];
    
    
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:
                                     [[TbFavouriteViewController alloc ] init]];
    
    UITabBarItem *item1 = [[ UITabBarItem alloc] initWithTitle: @"fav"
                                                        image: [UIImage imageNamed:@"tabConfig"]
                                                        tag:1001];
    
    UINavigationController *navi2 = [[ UINavigationController alloc ] initWithRootViewController:
                                     [[TbWeitaoViewController alloc ] init]];
    UITabBarItem *item2 = [[ UITabBarItem alloc] initWithTitle: @"weitao"
                                                         image: [UIImage imageNamed:@"tabWei"]
                                                           tag:1001];
    
    UINavigationController *navi3 = [[ UINavigationController alloc] initWithRootViewController:
                                     [[TbIndexViewController alloc] init]];
    UITabBarItem *item3 = [[ UITabBarItem alloc] initWithTitle: @"index"
                                                         image: [UIImage imageNamed:@"tabMain"]
                                                           tag:1001];

    
    
    
    UITabBarItem *item4 = [[ UITabBarItem alloc] initWithTitle: @"network"
                                                         image: [UIImage imageNamed:@"tabDiscovery"]
                                                           tag:1002];
    UINavigationController *navi4 = [[ UINavigationController alloc] initWithRootViewController:
                                     [[ NetworkTableViewController alloc] init]];
    
    UITabBarItem *item5 = [[ UITabBarItem alloc] initWithTitle: @"search"
                                                         image: [UIImage imageNamed:@"iconfont-search" ]
                                                           tag:1002];
    UINavigationController *navi5 = [[ UINavigationController alloc] initWithRootViewController:
                                     [[ TbSearchViewController alloc] init]];

    
    [navi1 setTabBarItem:item1];
    [navi2 setTabBarItem:item2];
    [navi3 setTabBarItem:item3];
    [navi4 setTabBarItem:item4];
    [navi5 setTabBarItem:item5];
    
    [tabController setViewControllers: @[navi3, navi5, navi4,  navi2, navi1]];
    
    
    return YES;
}

- (void) popWindow{
    TbFavouriteViewController * viewController = [[TbFavouriteViewController alloc] init];
    [self.navi pushViewController:viewController animated:YES];
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}



- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
