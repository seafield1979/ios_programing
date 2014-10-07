//
//  UNTabScrollView.m
//  UNOogiriTest
//
//  Created by B02681 on 2014/09/30.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "UNTabScrollView.h"

@implementation UNTabScrollView

#define kButtonWidth  (100.0f)
#define kButtonHeight  (100.0f)

#define kScreenWidth ([[UIScreen mainScreen]bounds].size.width)

#pragma mark - Public method
//ボタン情報を元にViewを作成する
-(void)initWithButtonList:(NSArray*)buttonList
{
    self.selectedButtonId = 0;
    NSInteger buttonNum = [buttonList count];
    CGFloat ofsx = 0.0f;
    NSMutableArray *tempButtons = @[].mutableCopy;
    NSMutableArray *tempParams = @[].mutableCopy;
    
    // ページング
    //self.pagingEnabled = YES;
    
    // サイズを設定
    self.frame = CGRectMake(0, 0, kScreenWidth, kButtonHeight);
    self.contentSize = CGSizeMake(kButtonWidth * buttonNum, kButtonHeight);
    
    CGFloat colorRange = 1.0 / buttonNum;
    for(int i=0; i<buttonNum; i++){
        UIColor *color = [UIColor colorWithRed:i*colorRange green:i*colorRange blue:i*colorRange alpha:1.0];
        UIButton *button = [self createTabButtonWithFrame:CGRectMake(ofsx, 0, kButtonWidth, kButtonHeight)
                                                    index:i
                                                    title:buttonList[i][@"title"]
                                                    color:color];
        [tempButtons addObject:button];
        [tempParams addObject: @{@"color" : color}];
        
        ofsx += kButtonWidth;
        
        // ScrollViewにボタンを配置
        [self addSubview:button];
    }
    
    self.buttons = (NSArray*)tempButtons;
    self.buttonParams = (NSArray*)tempParams;
}


#pragma mark - Private method

/*
 * タブバーボタンを作成する
 * @param frame  ボタンの座標
 * @param index  ボタンの番号。左から順に0,1,2...n
 * @param title  タイトル
 * @param bgColor  背景色
 */
-(UIButton*)createTabButtonWithFrame:(CGRect)frame index:(NSInteger)index title:(NSString*)title color:(UIColor*)bgColor
{
    // ボタンを生成
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    button.backgroundColor = bgColor;
    button.tag = index;
    [button setTitle:title forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

/*
 * ボタンが押されたときの処理
 */
-(void)buttonTapped:(id)sender
{
    if([sender isKindOfClass:[UIView class]]){
        UIButton *button = (UIButton*)sender;
        NSLog(@"%lu", button.tag);
        
        [self buttonDidSelected:button buttonId:button.tag];
        
    }
}

//ボタンが選択されたときの処理
-(void)buttonDidSelected:(UIButton*)button buttonId:(NSInteger)buttonId
{
    
    // 選択されたボタンが中央に来るようにスクロール
    CGFloat moveX = buttonId * kButtonWidth - (kScreenWidth - kButtonWidth) / 2;
    if(moveX < 0){
        moveX = 0;
    }
    else if(moveX + kScreenWidth > self.contentSize.width){
        moveX = self.contentSize.width - kScreenWidth;
    }
    NSLog(@"moveX : %f", moveX);
    
    [UIView animateWithDuration:0.5f animations:^(void){
        if( buttonId != self.selectedButtonId){
            //選択されたボタンの色を変更する
            button.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            //以前選択されていたボタンの色を元に戻す
            UIColor *color = ((UIColor*)(self.buttonParams[self.selectedButtonId])[@"color"]);
            UIButton *preButton = (UIButton*)self.buttons[self.selectedButtonId];
            preButton.backgroundColor = color;
            [preButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }];
    self.selectedButtonId = (int)buttonId;
    
    [self setContentOffset:CGPointMake(moveX, 0) animated:YES];
}


@end
