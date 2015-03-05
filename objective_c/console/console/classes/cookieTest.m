//
//  cookieTest.m
//  console
//
//  Created by B02681 on 2015/03/05.
//  Copyright (c) 2015年 海野 秀祐. All rights reserved.
//
/*
    Cookieのテスト
 
 取得
     // cookieをすべてコンソールに出力する
     NSHTTPCookieStorage *cookieStrage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
     for (NSHTTPCookie* cookie in [cookieStrage cookies]) {
         NSString *tempStr = [NSString stringWithFormat: @"cookie: %@=%@", [cookie name], [cookie value]];
         LOG(@"%@", tempStr);
     }
 
 保存
     //value: クッキーの値
     //key:   クッキーのキー名  "hoge"
     //domain: クッキーを適用するドメイン(http://ameba-oogiri.jp)
     //path:   クッキーの有効適用範囲(サーバ上のパス "/")
     //expires: クッキーの有効期限(0は無限) NSDateの日付
     
     //クッキーを作成
     NSDictionary *properties = [[NSMutableDictionary alloc] init];
     [properties setValue:[value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
     forKey:NSHTTPCookieValue];
     [properties setValue:key forKey:NSHTTPCookieName];
     [properties setValue:domain forKey:NSHTTPCookieDomain];
     [properties setValue:expires forKey:NSHTTPCookieExpires];
     [properties setValue:path forKey:NSHTTPCookiePath];
     NSHTTPCookie *cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
     
     //共通クッキーストレージを取得してセット
     NSHTTPCookieStorage *aStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
     [aStorage setCookie:cookie];
 */

#import "cookieTest.h"

@implementation cookieTest

- (void)test1
{
    [self removeAllCookie];
    
    // 今から3秒後
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:3.0];
    [self saveCookie:@"hogetarou" key:@"test1" domain:@"stg.ameba-oogiri.jp" path:@"/" expires:date];

    // 今から1年後
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:3600 * 24 * 365];
    [self saveCookie:@"hogejirou" key:@"test2" domain:@"stg.ameba-oogiri.jp" path:@"/" expires:date2];

    [self dispCookies];
}

- (void)test2
{
    NSLog(@"dispCookies -----");
    [self dispCookies];
    
    NSLog(@"dispValidCookies -----");
    [self dispValidCookies];
}

//value: クッキーの値
//key:   クッキーのキー名  "hoge"
//domain: クッキーを適用するドメイン(http://ameba-oogiri.jp)
//path:   クッキーの有効適用範囲(サーバ上のパス "/")
//expires: クッキーの有効期限(0は無限) NSDateの日付
- (void)saveCookie:(NSString*)value
               key:(NSString*)key
            domain:(NSString*)domain
              path:(NSString*)path
           expires:(NSDate*)expires
{
    // 保存（すぐ期限が切れるCookieを作成）
    NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
    [properties setObject:value
                  forKey:NSHTTPCookieValue];
    [properties setValue:key forKey:NSHTTPCookieName];
    [properties setValue:domain forKey:NSHTTPCookieDomain];
    [properties setValue:expires forKey:NSHTTPCookieExpires];
    [properties setValue:path forKey:NSHTTPCookiePath];
    NSHTTPCookie *cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
    
    //共通クッキーストレージを取得してセット
    NSHTTPCookieStorage *aStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [aStorage setCookie:cookie];
}

// Cookieを表示する
- (void)dispCookies
{
    // cookieをすべてコンソールに出力する
    NSHTTPCookieStorage *cookieStrage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie* cookie in [cookieStrage cookies]) {
        NSString *tempStr = [NSString stringWithFormat: @"cookie: %@=%@ (%@)", [cookie name], [cookie value], [cookie expiresDate]];
        NSLog(@"%@", tempStr);
    }
}

// 有効期限内のCookieを表示する
- (void)dispValidCookies
{
    NSDate *dateNow = [NSDate date];
    NSHTTPCookieStorage *cookieStrage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie* cookie in [cookieStrage cookies]) {
        NSComparisonResult result = [dateNow compare:[cookie expiresDate]];
        NSLog(@"%@=%@", [cookie name], [cookie value]);
        switch(result) {
            case NSOrderedSame: // 一致したとき
                break;
            case NSOrderedAscending: // dateNowが小さいとき
                NSLog(@"期限内（dateNowのが小）");
                break;
            case NSOrderedDescending: // dateNowが大きいとき
                NSLog(@"期限切れ（dateNowのが大）");
                break;
        }
        NSString *tempStr = [NSString stringWithFormat: @"cookie: %@=%@ (%@)", [cookie name], [cookie value], [cookie expiresDate]];
        NSLog(@"%@", tempStr);
    }
    
}

// Cookieをすべて削除する
- (void)removeAllCookie
{
    // Cookie削除
    NSHTTPCookieStorage *cookieStrage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (id obj in[cookieStrage cookies]) {
        [cookieStrage deleteCookie:obj];
    }
}
@end
