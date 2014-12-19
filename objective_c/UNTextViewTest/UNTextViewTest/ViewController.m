//
//  ViewController.m
//  UNTextViewTest
//
//  Created by Shusuke Unno on 2014/12/18.
//  Copyright (c) 2014年 Shusuke Unno. All rights reserved.
//
/*  ページの下に配置されたTextViewをタップしたときにソフトウェアキーボードでTextViewが隠れなくする処理
 
    仕組み
      あらかじめページのViewをScrollViewのSubViewにしておく
      View  ページのView
        ScrollView
          View  ページに表示するコンテンツの親View
            TextView and other Views
*/

#import "ViewController.h"

const static NSInteger _characterMax = 45;
const static NSInteger _lineMax = 3;

@interface ViewController ()

@property (nonatomic) CGRect scrollViewRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    // ScrollView初期化
    [self initScrollView];
    
    // TextView初期化
    [self initTextView];
    
    // キーボード表示・非表示時のイベント登録
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark 完了ボタンのクリック
-(void)doneBtnClicked {
    [self.textView resignFirstResponder];
}


#pragma mark - UITextFieldDelegate
/*
 * テキストの内容が変更されたときの処理
 * 行数制限、文字数制限
 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString *newString = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    // 文字数制限
    if (newString.length > _characterMax) {
        return NO;
    }
    
    // 行数制限
    __block NSInteger lineCount = 0;
    NSString *lastChara = [newString substringFromIndex:(newString.length - 1)];
    if ([lastChara isEqualToString:@"\n"]) {
        lineCount = 1;
    }
    [newString enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
        lineCount++;
    }];
    if (lineCount > _lineMax){
        return NO;
    }
    
    return YES;
}

#pragma mark - UIScrollViewDelegate

#pragma mark - Private method

/*
 * キーボード表示時の処理
 */
- (void)keyboardWillShown:(NSNotification *)notification
{
    // キーボードの top を取得する
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.scrollView convertRect:keyboardRect fromView:nil]; // 座標変換。お約束らしいがよくわかっていない。。
    
    // キーボードに隠れない場合は何もしない
    if (CGRectGetMaxY(self.textView.frame) < CGRectGetMinY(keyboardRect)) {
        return;
    }

    CGFloat nowOffsetY = self.scrollView.contentOffset.y;
    
    // スクロールさせる距離を算出
    CGFloat offsetY = CGRectGetMaxY(self.textView.frame) - CGRectGetMinY(keyboardRect);
    
    // scrollView の contentInset と scrollIndicatorInsets の bottom に追加
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, offsetY, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // 移動後のオフセット算出
    CGPoint scrollPoint = CGPointMake(0.0, nowOffsetY + offsetY);

    // キーボードアニメーションと同じ間隔、速度になるように設定
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
    [UIView setAnimationCurve:[notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // 移動後のオフセット設定
    self.scrollView.contentOffset = scrollPoint;
    
    // 表示アニメーション開始
    [UIView commitAnimations];
}

/*
 * キーボードが隠れるときの処理
 */
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

+ (CGSize)getScreenSize
{
    return [[UIScreen mainScreen] bounds].size;
}

/**
 * スクロールビューを初期化
 */
-(void)initScrollView
{
    self.scrollView.contentSize = self.baseView.frame.size;
    self.scrollView.delegate = self;
    self.scrollViewRect = self.scrollView.frame;
}


/*
 * TextView初期化
 */
-(void)initTextView
{
    // delegate
    self.textView.delegate = self;
    
    // ⬇キーボードの上に完了ボタンを配置する
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

@end
