//
//  TableViewController3.m
//  ViewControllerTest
//
//  Created by B02681 on 2014/10/07.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 UIViewControllerにUITableViewを配置するパターン
 自由にレイアウトできるのでこのパターンがbennri
 */



#import "TableViewController3.h"
#import "TableView3Cell.h"


#define CUSTOM_CELL_NIB @"TableView3Cell"

// セクション数
#define kSectionNum     (3)
// 列数
#define kRowNum         (5)
// セルの高さ
#define kRowHeight      (44)

#define kTotalRowNum    (kSectionNum * kRowNum)


@interface TableViewController3 ()

@end

@implementation TableViewController3

- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
    
    // デリゲートメソッドをこのクラスで実装する
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    
    // 境界線を消す
    self.tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
                                      
    // テーブルに表示したいデータソースをセット
    NSMutableArray *tempArray = @[].mutableCopy;
    NSMutableArray *tempArray2 = @[].mutableCopy;
    for(int i=0; i<kSectionNum; i++){
        for(int j=0; j<kRowNum; j++){
            NSString *str = [NSString stringWithFormat:@"cell %d %d", i, j];
            [tempArray2 addObject: str];
        }
        [tempArray addObject: tempArray2];
    }
    
    self.dataSourceiPhone = (NSArray*)tempArray;
    
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
    return kSectionNum;
}

/**
 * セクションの列数を返す
 * @param section セクション番号
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kRowNum;
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
    
    // 背景色  白 灰 の繰り返し
    cell.cellView.backgroundColor = (((indexPath.section * kRowNum) + indexPath.row) % 2) ? [UIColor grayColor] : [UIColor whiteColor];
    
    
    // Configure the cell.
    cell.label1.text = self.dataSourceiPhone[indexPath.section][indexPath.row];
    return cell;
}

/*
 * セルの高さを返す
 * @param indexPath セクション、列数を格納したクラス  section:セクション番号 / row:列数
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kRowHeight;
}

/*
 * セルがタップされたときにコールされるメソッド
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //itemArray の指定番目の文字列をステータスバーのラベルにセット
    //[indexPath row]で、何行目のセルがタップされたかを取得
    self.label1.text = self.dataSourceiPhone[indexPath.section][indexPath.row];
}



@end
