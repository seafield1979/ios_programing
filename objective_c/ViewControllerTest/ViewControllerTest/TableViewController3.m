//
//  TableViewController3.m
//  ViewControllerTest
//
//  Created by B02681 on 2014/10/07.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "TableViewController3.h"
#import "TableView3Cell.h"


#define CUSTOM_CELL_NIB @"TableView3Cell"

@interface TableViewController3 ()

@end

@implementation TableViewController3

- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
    
    // デリゲートメソッドをこのクラスで実装する
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    
    // テーブルに表示したいデータソースをセット
    self.dataSourceiPhone = @[@"iPhone 4", @"iPhone 4S", @"iPhone 5", @"iPhone 5c", @"iPhone 5s"];
    self.dataSourceAndroid = @[@"Nexus", @"Galaxy", @"Xperia"];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource delegate methods

/*
 * セクション数を返す
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

/**
 * セクションの列数を返す
 * @param section セクション番号
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


/*
 * テーブルのセルを返す
 * @param indexPath セクション、列数を格納したクラス  section:セクション番号 / row:列数
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableView3Cell* cell = (TableView3Cell*)[tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_NIB];
    if (cell == nil) {
        UINib* nib = [UINib nibWithNibName:CUSTOM_CELL_NIB bundle:nil];
        NSArray* array = [nib instantiateWithOwner:nil options:nil];
        cell = array[0];
    }
    
    // Configure the cell.
    cell.label1.text = [NSString stringWithFormat:@"section%ld row%ld", indexPath.section, indexPath.row];
//    cell.cellImage1.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image%d", (indexPath.row % 2)+1]];
    return cell;
}

/*
 * セルの高さを返す
 * @param indexPath セクション、列数を格納したクラス  section:セクション番号 / row:列数
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
#if 1
    if(indexPath.row & 1){
        return 50;
    }
    else{
        return 80;
    }
#else
    return cellHeight_;
#endif
}


@end
