//
//  TableViewController3.h
//  ViewControllerTest
//
//  Created by B02681 on 2014/10/07.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController3 : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView1;

/**
 *  テーブルに表示する情報が入ります。
 */
@property (nonatomic, strong) NSArray *dataSourceiPhone;
@property (nonatomic, strong) NSArray *dataSourceAndroid;


@end
