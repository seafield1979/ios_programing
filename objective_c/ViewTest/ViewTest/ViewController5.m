//
//  ViewController5.m
//  ViewTest
//
//  Created by B02681 on 2014/12/24.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/*
 * subviewを初期化する
 */
- (void)initSubViews
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"view5" owner:self options:nil];
    
    self.view1 = views[0];
    self.view2 = views[1];
    
    CGRect tempRect = self.view1.frame;
    tempRect.origin.x = 50;
    tempRect.origin.y = 50;
    self.view1.frame = tempRect;
    [self.view addSubview:self.view1];
    
    tempRect = self.view2.frame;
    tempRect.origin.x = 50;
    tempRect.origin.y = 200;
    self.view2.frame = tempRect;
    [self.view addSubview:self.view2];
}

@end
