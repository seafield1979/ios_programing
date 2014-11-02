//
//  UNButton.h
//  ViewTest
//
//  Created by B02681 on 2014/10/31.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZabutonCompletion)(void);

@interface UNButton : UIButton

// アニメーション終了時に呼ばれる
@property (nonatomic, strong) ZabutonCompletion endAnimatedCompletion;

@end
