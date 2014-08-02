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
 
 
 */

#import <Foundation/Foundation.h>

/*
 * 親クラス
 */
@interface classTest : NSObject
{
@public
	// クラス外部からアクセス可能
	NSString *name;
@protected
	// 子クラスからアクセス可能
	NSString *protected_name;
@private
	// クラス外部からアクセス禁止
	NSString *private_name;
}
-(id)init;
-(void)print;
-(void)print:(int)val1 val2:(NSString*)val2;
@end

/*
 * 子クラス
 */
@interface classTest2 : classTest
{
	NSString *child_name;
}
-(void)print;
@end

/**
 * コンストラクタ
 */
@interface initTest : NSObject
{
	int value1;
	int value2;
	int value3;
}
- (id) initWithAllParams:(int)val1 val2:(int)val2 val3:(int)val3;
- (id) initWithValue1:(int)val1;
- (id) init;
- (void)print;
@end
