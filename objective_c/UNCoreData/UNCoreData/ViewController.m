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
}

- (IBAction)addButtonDidTap:(id)sender {
    NSString *text = self.addNameTextView.text;
    if (text && text.length > 0) {
        [[MyDataManager sharedManager]addObject:text age:1];
        [self getButtonDidTap:nil];
    }
}

- (IBAction)deleteButtonDidTap:(id)sender {
    [[MyDataManager sharedManager]deleteAllObject];
    [self getButtonDidTap:nil];
}

- (IBAction)getButtonDidTap:(id)sender {
    
    NSArray *moArray = [[MyDataManager sharedManager]getObjects];
    // 検索結果をコンソールに出力してみます。
    // fetchedObjectsというメソッドで、検索結果一覧を配列で受け取れます。
    NSMutableString *text = @"".mutableCopy;
    for (int i = 0; i < moArray.count; i++) {
        NSManagedObject *object = [moArray objectAtIndex:i];
        NSString *name   = [object valueForKey:@"name"];
        NSNumber *age    = [object valueForKey:@"age"];
        [text appendString:[NSString stringWithFormat:@"name=%@ age=%@\n", name, age]];
    }
    self.textView.text = text;
}


- (IBAction)updateButtonDidTap:(id)sender {
    NSString *oldName = self.oldNameTextView.text;
    NSString *newName = self.updateNameTextView.text;
    if (oldName && oldName.length > 0 &&
        newName && newName.length > 0)
    {
        [[MyDataManager sharedManager]updateObject:oldName newName:newName age:10];
    }
    [self getButtonDidTap:nil];
}

@end
