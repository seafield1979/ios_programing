//
//  CustomTableViewCell.h
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/09.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cellImage;

@property (strong, nonatomic) IBOutlet UILabel *cellLabel;


/*
 * セルの高さを返す
 */
+ (CGFloat)rowHeight;

@end
