//
//  TableViewController.m
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
	NSArray *sectionList;
    NSDictionary *dataSource;
}
@end

@implementation TableViewController

-(id)init
{
	self = [super initWithStyle:UITableViewStylePlain];
	if (self) {
		// ・・・・
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// セクション名を設定する
    sectionList = [NSArray arrayWithObjects:@"人間", @"犬", @"その他", nil];

    // セルの項目を作成する
	NSArray *peple = [NSArray arrayWithObjects:@"Charlie", @"Sally", @"Lucy", nil];
    NSArray *dogs  = [NSArray arrayWithObjects:@"Snoopy", @"Spike", @"Olaf", nil];
    NSArray *others = [NSArray arrayWithObjects:@"Woodstock", nil];

    // セルの項目をまとめる
    NSArray *datas = [NSArray arrayWithObjects:peple, dogs, others, nil];

    dataSource = [NSDictionary dictionaryWithObjects:datas forKeys:sectionList];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/**
 * テーブルのアイテム数を返す
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
	return [sectionList count];

}

#pragma mark - Table view delegate

/**
 * 指定されたセクションのセクション名を返す
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionList objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
	NSString *sectionName = [sectionList objectAtIndex: section];
    return [[dataSource objectForKey:sectionName] count];
}


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
    NSString *sectionName = [sectionList objectAtIndex:indexPath.section];

    // セクション名をキーにしてそのセクションの項目をすべて取得
    NSArray *items = [dataSource objectForKey:sectionName];

    // セルにテキストを設定
    cell.textLabel.text = [items objectAtIndex:indexPath.row];

    return cell;
}

/**
 * セルが選択されたとき
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // セクション名を取得する
    NSString *sectionName = [sectionList objectAtIndex:indexPath.section];

    // セクション名をキーにしてそのセクションの項目をすべて取得
    NSArray *items = [dataSource objectForKey:sectionName];

    NSLog(@"「%@」が選択されました", [items objectAtIndex:indexPath.row]);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



@end
