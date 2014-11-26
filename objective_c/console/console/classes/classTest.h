//
//  classTest.h
//  console
//
//  Created by 海野 秀祐 on 2014/08/02.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/**
 クラスの定義は
 @interface クラス名 : 親クラス名
 {
	変数の定義
 }
 メソッドの定義
 @end
 
 ※Objective-Cでは多重継承はできない
 継承することによって既存のクラスのインスタンス変数、メソッドを引き継いだクラスを作成できる
 継承される側がスーパークラス、親クラスといわれ、継承した側がサブクラス、子クラスといわれる
 複数のクラスを一気に継承する（多重継承）はできないが、スーパークラスのスーパークラスが存在するのはかまわない
 スーパークラスで実装されているものは、階層関係にあるサブクラスであれば使用可能である
 すべてのクラスはルートクラスが基となっている
 実装の際はスーパークラスを定義しているヘッダーファイルをインポートする必要がある
 オーバーライドという処理の上書き機能により既存のメソッドを拡張できる
 メソッドがオーバライドされていれば、その上書きされた方の処理が呼び出され、オーバライドされていなければ
 スーパークラスの処理が呼び出される
 
 
 サンプル
   親クラスの変数参照
 　親クラスのメソッド呼び出し
 　親クラスのメソッドのオーバーライド

 
 */

#import <Foundation/Foundation.h>

/*
 * 親クラス
 */
@interface parentClass : NSObject

@property (nonatomic, strong) NSString *name;

-(id)init;
-(void)print;
@end

/*
 * 子クラス
 */
@interface childClass : parentClass

@property (nonatomic, strong) NSString *name;

-(void)print;   // 親クラスをオーバーライド
@end


/*
 * テストクラス
 */
@interface classTest : NSObject

- (void)test;

@end
