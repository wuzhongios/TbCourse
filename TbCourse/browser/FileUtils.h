//
//  FileUtils.h
//  TbCourse
//
//  Created by wuzhong on 14-8-16.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FileUtils : NSObject

+ (void) prepareRootDir : (NSString*) relativePath;

+ (void) removeRootDir;

+ (void) saveResponse : (NSData*) response atPath : (NSString*) relativePath;

+ (NSData*) readFile : (NSString*) relativePath;

@end
