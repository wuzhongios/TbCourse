//
//  BrowserCache.m
//  TbCourse
//
//  Created by wuzhong on 14-8-16.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "BrowserCache.h"
#import "FileUtils.h"


@implementation BrowserCache



- (id) init {
    
    self = [super init];
    
    if(self){
    
        [FileUtils prepareRootDir:@"webviewcache"];
        
        self.map = [[NSMutableDictionary alloc] init];
    
    }
    
    return self;

}


- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request{
    
    NSString* path =  [[request URL] absoluteString] ;
    
    NSLog(@"cache response for request %@",path);
    
    NSData* data =  [FileUtils readFile:path];
    
    if(data){
        
        NSString* mimeType = [self getMimtype:path];
        NSLog(@" mimetype is %@" , mimeType);
        
        NSURLResponse *response = [[NSURLResponse alloc] initWithURL:[request URL]
                                                             MIMEType:mimeType
                                                expectedContentLength:[data length]
                                                    textEncodingName:nil];
        
        return[[NSCachedURLResponse alloc] initWithResponse:response data:data];
        
    }
    
    return nil;
}

- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request{

    NSString* path =  [[request URL] absoluteString];

    [self.map  setObject:[cachedResponse response].MIMEType forKey: path];
    
    [FileUtils saveResponse:[cachedResponse data] atPath:path];
    
}

/*!
 @method removeCachedResponseForRequest:
 @abstract Removes the NSCachedURLResponse from the cache that is
 stored using the given request.
 @discussion No action is taken if there is no NSCachedURLResponse
 stored with the given request.
 @param request the NSURLRequest to use as a key for the lookup.
 */
- (void)removeCachedResponseForRequest:(NSURLRequest *)request{

    

}

/*!
 @method removeAllCachedResponses
 @abstract Clears the given cache, removing all NSCachedURLResponse
 objects that it stores.
 */
- (void)removeAllCachedResponses{

    [FileUtils removeRootDir];

}

- (NSString*) getMimtype : (NSString *) url{

    NSString* type = [self.map objectForKey: url];
    
    
    return type;
    
    
//    NSURLRequest *request = [ NSURLRequest requestWithURL:[NSURL fileURLWithPath:url]];
//    
//    NSURLResponse *response;
//    
//    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
//    
//    type = [response MIMEType];
//
//    [self.map setObject:type forKey:url];
//    
//    return type;
//
}


@end
