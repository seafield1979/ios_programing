//
//  ModalViewController1.m
//  UNOogiriTest
//
//  Created by B02681 on 2014/09/30.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ModalViewController1.h"

@interface ModalViewController1 ()

@end

@implementation ModalViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)closeButtonDidTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
