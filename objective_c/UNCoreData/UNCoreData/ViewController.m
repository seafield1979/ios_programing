//
//  ViewController.m
//  UNCoreData
//
//  Created by B02681 on 2015/07/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import "ViewController.h"
#import "MyDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonDidTap:(id)sender {
    
    [[MyDataManager sharedManager]addObject:@"hoge" age:1];
}

- (IBAction)deleteButtonDidTap:(id)sender {
    [[MyDataManager sharedManager]deleteObject:@"syutaro" age:35];    
}

- (IBAction)getButtonDidTap:(id)sender {
    
    NSArray *moArray = [[MyDataManager sharedManager]getObjects];
    // 検索結果をコンソールに出力してみます。
    // fetchedObjectsというメソッドで、検索結果一覧を配列で受け取れます。
    for (int i = 0; i < moArray.count; i++) {
        NSManagedObject *object = [moArray objectAtIndex:i];
        NSString *name   = [object valueForKey:@"name"];
        NSNumber *age    = [object valueForKey:@"age"];
        NSLog(@"name=%@ age=%@", name, age);
    }
    
}


- (IBAction)updateButtonDidTap:(id)sender {
    [[MyDataManager sharedManager]updateObject:@"syutaro" newName:@"hagetaro" age:10];
}

@end
