//
//  ViewController.m
//  UNTextViewTest
//
//  Created by B02681 on 2014/12/18.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView *scrollView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // delegate
    self.textView.delegate = self;
    
    // スクロール
    [self initScrollView];
//    self.scrollView.delegate = self;
//    self.scrollView.contentSize = CGSizeMake(self.baseView.frame.size.width, self.baseView.frame.size.height);
//    
//    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
//    self.contentView.backgroundColor = [UIColor blueColor];
//    [self.scrollView addSubview:self.contentView];
    
    // ViewとDoneボタンの作成
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    keyboardDoneButtonView.barStyle  = UIBarStyleBlack;
    keyboardDoneButtonView.translucent = YES;
    keyboardDoneButtonView.tintColor = nil;
    [keyboardDoneButtonView sizeToFit];
    
    // 完了ボタンとSpacerの配置
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"finish" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtnClicked)];
    UIBarButtonItem *spacer1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:spacer, spacer1, doneButton, nil]];
    
    // Viewの配置
    self.textView.inputAccessoryView = keyboardDoneButtonView;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // キーボード表示・非表示時のイベント登録
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark 完了ボタンのクリック
-(void)doneBtnClicked {
    [self.textView resignFirstResponder];
}


#pragma mark - UITextFieldDelegate

// リターンキーが押されたら、キーボードを閉じる
- (BOOL)textViewShould:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - UIScrollViewDelegate

// スクロール時の処理
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//}



#pragma mark - Private method

- (void)keyboardWillShown:(NSNotification *)notification
{
    // キーボードの top を取得する
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.scrollView convertRect:keyboardRect fromView:nil]; // 座標変換。お約束らしいがよくわかっていない。。
    
    CGRect textFieldRect;
//    if (_activeTextView != nil) {
//        textFieldRect = _activeTextView.frame;
//    }
//    if (_activeField != nil) {
//        textFieldRect = _activeField.frame;
//    }
    
    // キーボードに隠れない場合は何もしない
    if (CGRectGetMaxY(self.textView.frame) < CGRectGetMinY(keyboardRect)) {
        return;
    }
    
    
    // ScrollViewのサイズを(画面高さ - キーボードの高さ)に変更
    CGRect tempRect = self.scrollView.frame;
    tempRect.size.height = 300;
    self.scrollView.frame = tempRect;
#if 0
    CGFloat nowOffsetY = self.scrollView.contentOffset.y;
    
    // スクロールさせる距離を算出
    CGFloat offsetY = CGRectGetMaxY(textFieldRect) - CGRectGetMinY(keyboardRect);
    
    // scrollView の contentInset と scrollIndicatorInsets の bottom に追加
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, offsetY, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // 移動後のオフセット算出
    CGPoint scrollPoint = CGPointMake(0.0, nowOffsetY + offsetY);
#endif
    // キーボードアニメーションと同じ間隔、速度になるように設定
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
    [UIView setAnimationCurve:[notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // 移動後のオフセット設定
    //self.scrollView.contentOffset = scrollPoint;
    
    // 表示アニメーション開始
    [UIView commitAnimations];
}

- (void)keyboardWillHidden:(NSNotification *)notification
{
    // キーボードアニメーションと同じ間隔、速度になるように設定
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
    [UIView setAnimationCurve:[notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // インセットを 0 にする
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // 非表示アニメーション開始
    [UIView commitAnimations];
}

/**
 * スクロールビューを初期化
 * 4ページ分のコンテンツをスクロールする
 */
-(void)initScrollView
{
    self.scrollView2 = [[UIScrollView alloc]initWithFrame: CGRectMake(0, 0, 320, 480)];
    self.scrollView2.contentSize = CGSizeMake(320, 1000);
    self.scrollView2.delegate = self;
    
    // viewにScrollViewを追加
    [self.view addSubview:self.scrollView2];
    
    
    [self.scrollView2 addSubview:self.baseView];
}



@end
