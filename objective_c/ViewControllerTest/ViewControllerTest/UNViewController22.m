//
//  UNViewController22.m
//  ViewControllerTest
//
/*
 １つのnibを複数のクラスで使い回すテスト
 UNViewController21 用のnibを子クラスのUNViewController22 
 */


#import "UNViewController22.h"

@interface UNViewController22 ()

@end

@implementation UNViewController22

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)button1DidTap:(id)sender {
    NSLog(@"hoge22");       // UNViewController22 クラスでボタンをタップするとこれが呼ばれる
}

- (void)print1
{
    NSLog(@"22:button1DidTap");
}

@end
