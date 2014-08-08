//
//  SearchModel.h
//  TbCourse
//
//  Created by wuzhong on 14-8-7.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchDataCallback.h"

@interface SearchModel : NSObject

@property (nonatomic,strong) NSMutableArray* items;

@property(nonatomic,retain) id<SearchDataCallback> detegate;

/**
 * query by keyword and index
 */
- (void) query : (NSString *)keyword
     withIndex : (int)index;

@end
