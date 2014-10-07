//
//  CustomTableViewCell.h
//  UNOogiriTest
//
//  Created by B02681 on 2014/10/07.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageThumb;
@property (weak, nonatomic) IBOutlet UILabel *labelDeviceName;
@property (weak, nonatomic) IBOutlet UILabel *labelCellNumber;

+ (CGFloat)rowHeight;

@end
