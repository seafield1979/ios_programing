//
//  TableViewController2.m
//  ViewControllerTest
//
//  Created by B02681 on 2014/08/26.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 UITableViewControllerを使用するバージョン
 */

#import "TableViewController2.h"
#import "CustomCell.h"

#define CUSTOM_CELL_NIB @"CustomCell"

@interface TableViewController2 ()
{
     CGFloat cellHeight_;
}

@end

@implementation TableViewController2

- (void)viewDidLoad
{
    self.title = @"Custom Cell Sample";
    
    // calc height of custom cell
    UINib* nib = [UINib nibWithNibName:CUSTOM_CELL_NIB bundle:nil];
    NSArray* array = [nib instantiateWithOwner:nil options:nil];
    CustomCell* cell = [array objectAtIndex:0];
    cellHeight_ = cell.frame.size.height;
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
    CustomCell* cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_NIB];
    if (cell == nil) {
        UINib* nib = [UINib nibWithNibName:CUSTOM_CELL_NIB bundle:nil];
        NSArray* array = [nib instantiateWithOwner:nil options:nil];
        cell = array[0];
    }
    
    // Configure the cell.
    cell.cellLabel1.text = [NSString stringWithFormat:@"section%d row%d", indexPath.section, indexPath.row];
    cell.cellImage1.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image%d", (indexPath.row % 2)+1]];
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

#pragma mark - Table view delegate

/*
 * セルが選択されたときの処理
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath %ld %ld", indexPath.section, indexPath.row);
}

@end
