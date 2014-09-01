//
//  CustomCell.m
//  ViewControllerTest
//
//  Created by B02681 on 2014/08/26.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib
{
    // Initialization code
    _cellImage1.image = [UIImage imageNamed:@"Image1"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
