//
//  Image+Label.h
//  TbCourse
//
//  Created by wuzhong on 14-8-3.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Image_Label : UIView

@property UIImageView *imageView;

@property UILabel *label;

- (void) initWithImg : (NSString *) img andLable : (NSString *) label;

@end
