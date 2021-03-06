//
//  urlTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/08/03.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "urlTest.h"

@implementation urlTest

-(void)test1
{
	// 文字列からurlを作成
	NSURL *url = [NSURL URLWithString:@"http://www.nintendo.co.jp/3ds/index.html"];
	NSLog(@"url: %@", url);

	// ファイルからurlを作成
	NSString *homeDir = NSHomeDirectory();
	NSString *path = [NSString stringWithFormat:@"%@/test1.txt", homeDir];
	NSURL *url2 = [NSURL fileURLWithPath:path];
	NSLog(@"url2: %@", url2);

//	-(NSString*)absoluteString 	URLを返す
//	（例）URLを取得する
	NSString *urlStr = [url absoluteString];
	NSLog(@"absoluteString %@", urlStr);

//	-(NSString*)host 	（例）URLのホスト名を返す
	urlStr = [url host];
	NSLog(@"host %@", urlStr);

//	-(NSString*)path 	（例）URLのパスを返す
	urlStr = [url path];
	NSLog(@"path %@", urlStr);

//	-(NSNumber*)port 	URLのポート番号を返す
//	（戻り値の例）8080
	NSNumber *port = [url port];
	NSLog(@"port %@", port);
       

//	-(BOOL)isFileURL 	ファイルのURLかどうかの判定
	NSLog(@"isFileURL %d %d", [url isFileURL], [url2 isFileURL]);
}


- (void)test2
{
    NSURL *url = [NSURL URLWithString:@"http://user:password@www.example.com:8080/hoge/fuga/index.html?a=1&b=2#test"];
    NSLog(@"absoluteString : %@", [url absoluteString]);
    NSLog(@"absoluteURL : %@", [url absoluteURL]);
    NSLog(@"baseURL : %@", [url baseURL]);
    NSLog(@"fragment : %@", [url fragment]);
    NSLog(@"host : %@", [url host]);
    NSLog(@"lastPathComponent : %@", [url lastPathComponent]);
    NSLog(@"parameterString : %@", [url parameterString]);
    NSLog(@"password : %@", [url password]);
    NSLog(@"path : %@", [url path]);
    NSLog(@"pathComponents : %@", [url pathComponents]);
    NSLog(@"pathExtension : %@", [url pathExtension]);
    NSLog(@"port : %@", [url port]);
    NSLog(@"query : %@", [url query]);
    NSLog(@"relativePath : %@", [url relativePath]);
    NSLog(@"relativeString : %@", [url relativeString]);
    NSLog(@"resourceSpecifier : %@", [url resourceSpecifier]);
    NSLog(@"scheme : %@", [url scheme]);
    NSLog(@"standardizedURL : %@", [url standardizedURL]);
    NSLog(@"user : %@", [url user]);
}

@end
