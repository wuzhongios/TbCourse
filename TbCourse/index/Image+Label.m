//
//  Image+Label.m
//  TbCourse
//
//  Created by wuzhong on 14-8-3.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "Image+Label.h"

@implementation Image_Label

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 2, 25, 25)];
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(7, 25, 40, 15)];
        
        self.label.textColor = [UIColor blackColor];
        
        self.label.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:11];
        
//        self.backgroundColor = [UIColor grayColor];
        
        [self addSubview:self.imageView];
        
        [self addSubview: self.label];
        
        //        [ imageView ini]
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) initWithImg : (NSString *) img andLable : (NSString *) label{

//    self = [super initWithFrame:CGRectMake(0, 0, 25, 40)];
    
    self.imageView.image = [UIImage imageNamed:img];
    
    self.label.text = label;
    
}

@end
