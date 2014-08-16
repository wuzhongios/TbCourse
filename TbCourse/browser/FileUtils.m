//
//  FileUtils.m
//  TbCourse
//
//  Created by wuzhong on 14-8-16.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "FileUtils.h"
#import <CommonCrypto/CommonDigest.h>

static NSString* root;
static NSFileManager* fileManager;
static BOOL inited;

@implementation FileUtils


+ (void) prepareRootDir : (NSString*) relativePath{
    
    if(inited){
        return;
    }
    
    inited = YES;

    if (!fileManager) {
        fileManager = [NSFileManager defaultManager];
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *firstPath = [paths objectAtIndex:0];

    //path拼接
    NSLog(@"before root path is %@",firstPath);
    NSString* path = [firstPath stringByAppendingPathComponent:relativePath];
    NSLog(@"after root path is %@",path);
    
    root = path;
//    
//    BOOL isDir = YES;
//    //dir是否存在
//    BOOL exist = [fileManager fileExistsAtPath:path isDirectory:&isDir];
//    
//    //dir创建
//    NSError* err = [[NSError alloc] init];
//    if(!exist){
//        BOOL succ = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&err];
//        NSLog(@"file manager create dir error is %@",err);
//        NSLog(@"file manager create dir is %hhd",succ);
//        
//    }
    [self removeRootDir];
}

+ (void) removeRootDir{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        BOOL succ = [fileManager removeItemAtPath:root error:nil];
        
        NSLog(@"remove root dir result is %hhd",succ);
        
        succ = [fileManager createDirectoryAtPath:root withIntermediateDirectories:YES attributes:nil error:nil];
        NSLog(@"file manager create dir is %hhd",succ);

        
    });
    
}

+ (void) saveResponse : (NSData*) response atPath : (NSString*) relativePath{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSString* path =  [root stringByAppendingPathComponent:[self md5:relativePath]];
        NSLog(@"save response at %@",path);
        
//        [response data];
        
        BOOL succ =  [fileManager createFileAtPath:path contents:response attributes:nil];
        NSLog(@"save response  result is %hhd",succ);
        
    });
}

+ (NSData*) readFile : (NSString*) relativePath{

    NSString* path = [root stringByAppendingPathComponent:[self md5:relativePath]];
    
//    NSLog(@"readFile at %@",path);

    if([fileManager fileExistsAtPath:path]){
        
       NSLog(@"readFile exist at %@",path);
        
       return [fileManager contentsAtPath:path];
    }
    
    NSLog(@"readFile at %@ , return nil",path);
    return nil;
    
}

+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]; 
}

@end
