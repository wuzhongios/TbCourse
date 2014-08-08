//
//  SearchDataCallback.h
//  TbCourse
//
//  Created by wuzhong on 14-8-7.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SearchDataCallback <NSObject>


- (void) receiveData : (NSArray*)arr;


@end
