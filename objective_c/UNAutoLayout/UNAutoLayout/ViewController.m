//
//  ViewController.m
//  UNAutoLayout
//
//  Created by B02681 on 2014/11/21.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ViewController.h"

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


/*
 * Returnボタンを押したときの処理
 *
 */
- (IBAction)returnButtonDidTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
