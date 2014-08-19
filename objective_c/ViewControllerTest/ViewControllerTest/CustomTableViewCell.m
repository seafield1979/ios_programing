//
//  CustomTableViewCell.m
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/09.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

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

/*
 * セルの高さを返す
 */
+ (CGFloat)rowHeight
{
    return 60.0f;
}

@end
