//
//  UNTabScrollView.h
//  UNOogiriTest
//
//  Created by B02681 on 2014/09/30.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNTabScrollView : UIScrollView

@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, strong) NSArray *buttonParams;
@property (assign) int selectedButtonId;

//ボタン情報を元にViewを作成する
-(void)initWithButtonList:(NSArray*)buttonList;






@end
