//
//  ItemTableViewCell.m
//  TbCourse
//
//  Created by wuzhong on 14-8-7.
//  Copyright (c) 2014年 com. All rights reserved.
//

#import "ItemTableViewCell.h"

@implementation ItemTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews

{
    
    [super layoutSubviews];
    
    [self.imageView setFrame:CGRectMake(10, 10,60, 60)];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
}

@end
