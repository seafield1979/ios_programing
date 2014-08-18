//
//  TableViewController2.h
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/09.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController2 : UITableViewController <UISearchDisplayDelegate>


@property (nonatomic, strong) NSArray *dataSourceiPhone;
@property (nonatomic, strong) NSArray *dataSourceAndroid;

@end
