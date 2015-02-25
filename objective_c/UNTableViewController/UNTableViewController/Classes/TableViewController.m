//
//  TableViewController.m
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
// ただのUITableView

#import "TableViewController.h"

@interface TableViewController ()
{
	NSArray *sectionList;       // セクションリスト
    NSDictionary *dataSource;   // データ
}
@end

@implementation TableViewController

-(id)init
{
	self = [super initWithStyle:UITableViewStylePlain];
	if (self) {
    // セクション名を設定する
    sectionList = [NSArray arrayWithObjects:@"人間", @"犬", @"その他", nil];
    
    // セルの項目を作成する
    NSArray *peple = [NSArray arrayWithObjects:@"Charlie", @"Sally", @"Lucy", nil];
    NSArray *dogs  = [NSArray arrayWithObjects:@"Snoopy", @"Spike", @"Olaf", nil];
    NSArray *others = [NSArray arrayWithObjects:@"Woodstock", nil];
    
    // セルの項目をまとめる
    dataSource = @{sectionList[0] : peple,
                   sectionList[1] : dogs,
                   sectionList[2] : others};

	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // テーブルのサイズを調整
    CGRect rect = [[UIScreen mainScreen]bounds];
    self.tableView.frame = CGRectMake(0, 20, rect.size.width, rect.size.height - 20);
    
}

#pragma mark - Table view delegate

/**
 * セクション数を返す
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [sectionList count];
}

/**
 * 指定されたセクションのセクション名を返す
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionList objectAtIndex:section];
}

/**
 * セクションのカラム数を返す
 * @param section セクション番号
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionName = sectionList[section];
    return [dataSource[sectionName] count];
}


/**
 * セルを取得する
 * @param indexPath  .
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    // セクション名を取得する
    NSString *sectionName = sectionList[indexPath.section];

    // セクション名をキーにしてそのセクションの項目をすべて取得
    NSArray *items = dataSource[sectionName];

    // セルにテキストを設定
    cell.textLabel.text = items[indexPath.row];

    return cell;
}

/**
 * セルが選択されたとき
 * @param indexPath .section  セクション番号
                    .row      項目番号
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // セクション名を取得する
    NSString *sectionName = sectionList[indexPath.section];

    // セクション名をキーにしてそのセクションの項目をすべて取得
    NSArray *items = dataSource[sectionName];

    NSLog(@"「%@」が選択されました", items[indexPath.row]);
}

@end
