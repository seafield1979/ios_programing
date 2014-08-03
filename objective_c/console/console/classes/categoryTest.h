//
//  categoryTest.h
//  console
//
//  Created by 海野 秀祐 on 2014/08/03.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface categoryTest : NSObject

-(void)test1;

@end

// カテゴリーで既存のクラスにメソッドを追加する
// ※通常は標準クラスや外部から提供されたSDKのクラス等、ソースが変更できないクラスに対して使用する
@interface categoryTest (Append)
-(void)test2;
@end
