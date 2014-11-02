//
//  ViewControllerNib.m
//  ViewTest
//
//  Created by UnnoShusuke on 2014/08/21.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "ViewControllerNib.h"

@interface ViewControllerNib ()

@end

@implementation ViewControllerNib

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
#if 0
    UINib *objectsNib =[UINib nibWithNibName:@"testNib" bundle:nil];
    NSArray *objects = [objectsNib instantiateWithOwner:nil options:nil];
    NSLog(@"%@", objects);
    
    // NSBundleから読み込むほうが簡単
    NSArray *objects2 = [[NSBundle mainBundle] loadNibNamed:@"testNib" owner:nil options:nil];
    NSLog(@"%@", objects2);
    for(NSObject *obj in objects2){
        NSLog(@"%@", obj);
    }
    
    // viewを設定
    //self.view = [objects2 objectAtIndex:1];
    self.view = [objects2 objectAtIndex:4];
    _view41 = [[self.view subviews] objectAtIndex: 0];
    _view41.backgroundColor = [UIColor greenColor];
    
    // buttonを追加
    _button1 = (UIButton*)[objects2 objectAtIndex:3];
    _button1.frame = CGRectMake(20, 50, 100, 30);
    [self.view addSubview: _button1];
    
    // ボタンを押したときのイベントを追加
    [_button1 addTarget:self action:@selector(button1DidTap:) forControlEvents:UIControlEventTouchUpInside];
#else
    [self.view addSubview:self.view2];
    
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - event method

-(void)button1DidTap:(id)sender
{
    NSLog(@"button1DidTap");
}

@end
