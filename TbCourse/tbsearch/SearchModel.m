//
//  SearchModel.m
//  TbCourse
//
//  Created by wuzhong on 14-8-7.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "SearchModel.h"
#import "AFHTTPRequestOperationManager.h"
#import "SearchDataCallback.h"

@implementation SearchModel

- (id) init{
    
    self = [super init];
    
    self.items = [[NSMutableArray alloc] init];
    
    NSLog(@"search model inited");
    
    return self;
}

- (void) query : (NSString *)keyword
     withIndex : (int)index{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString* url = [NSString stringWithFormat:@"http://s.m.taobao.com/search?buying=buyitnow&m=api4h5&atype=1&from=1&n=20&page=%d&q=%@",
                     index,keyword];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
        
        NSArray* list = responseObject[@"listItem"];
        
         NSLog(@"JSON: %lu", (unsigned long)self.items.count);
        
        //TODO
        [self.items addObjectsFromArray:list];
        
        NSLog(@"JSON: %lu", (unsigned long)self.items.count);
        
        NSArray* arr = [[NSArray alloc] initWithArray:self.items copyItems:YES];
        
        [self.detegate receiveData: arr ];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

@end
