//
//  ViewController.m
//  UNFileManager
//
//  Created by B02681 on 2015/08/03.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
 ファイルの読み込み、書き込みのサンプル
 
 書き込み
     // 保存先のパス
     NSString *writePath = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/MyDir"], @"hoge.txt"];
     
     // ファイルに書き込む
     BOOL result = [data writeToFile:writePath atomically:YES];
 
 読み込み
     NSString *readPath = [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/MyDir"], @"hoge.txt"];
     BOOL success = [[NSFileManager defaultManager] fileExistsAtPath:@"Documents/MyDir"];
     if(success) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:readPath];
        NSLog(@"%@", @(data.length));
     }
 
 読み込み（アプリのリソース)
     NSBundle *bundle = [NSBundle mainBundle];
     NSString *path = [bundle pathForResource:@"hoge" ofType:@"png"];
     NSData *data = [[NSData alloc]initWithContentsOfFile:path];
     NSLog(@"%@", @(data.length));
 
 Documents/ 以下の保存したファイルはiCloudに同期しないとリジェクと対象
 キャッシュファイルは Library/Caches 以下に保存する。これはiCloudに同期しなくてもOK
 */

#import "ViewController.h"

@interface ViewController ()

@end


NSString *fileDir = @"Documents/MyDir";
NSString *cacheDir = @"Library/Caches/imstorage-prod-1001398345/images/82";
NSString *saveFileName = @"c453b085746746ac398a147358ea29d3.jpg";
//NSString *saveFileName = @"mig?src=http\%3A\%2F\%2Fblogs.c.yimg.jp\%2Fres\%2Fblog-d7-68\%2Farauma77\%2Ffolder\%2F1868789\%2F88\%2F69344188\%2Fimg_0\%3F1399553071&twidth=110&theight=110&qlt=80&res_format=jpg&op=sc";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Action method

/**
 * プロジェクトのファイルを読み込む
 */
- (IBAction)readFileButtonDidTap:(id)sender
{
    NSData *data = [self readResouceFile:@"europ" extension:@"png"];
    NSLog(@"data size is %@", @(data.length));
}

/**
 * アプリで保存したファイル(hoge.txt)を読み込む
 */
- (IBAction)readFile2ButtonDidTap:(id)sender
{
    NSData *data = [self readFile:cacheDir fileName:saveFileName];
    if(data) {
        NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", dataStr);
    }
}

/**
 * アプリ以下にファイルを書き込む
 */
- (IBAction)createFileButtonDidTap:(id)sender
{
    // 保存するデータ
    NSData *data  = [[NSData alloc]initWithBytes:[@"syutaro" UTF8String] length:[@"syutaro" length]];

    BOOL result = [self saveToFile:data dirPath:cacheDir fileName:saveFileName];
    if (result) {
        NSLog(@"Write success!!");
    }
    else {
        NSLog(@"Write failed!!");
    }
}


/**
 * 指定したパスのディレクトリを作成する
 */
- (IBAction)createDirButtonDidTap:(id)sender
{
    if ([self createDirectory:@"hoge"]) {
        NSLog(@"create dir hoge");
    }
    if ([self createDirectory:@"Documents/hoge"]) {
        NSLog(@"create dir Documents/hoge");
    }
}


#pragma mark - Private method

/**
 * アプリ内のリソースファイルを読み込む
 */
- (NSData*)readResouceFile:(NSString*)fileName extension:(NSString*)extension
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:fileName ofType:extension];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    return data;
}

/**
 * アプリで保存したファイルを読み込む
 */
- (NSData*)readFile:(NSString*)fileDir fileName:(NSString*)fileName
{
    NSString *readPath = [NSString stringWithFormat:@"%@/%@",
                          [NSHomeDirectory() stringByAppendingPathComponent:fileDir], fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager fileExistsAtPath:readPath];
    if(success) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:readPath];
        return data;
    }
    return nil;
}

/**
 * ファイルにNSDataを保存する
 */
- (BOOL)saveToFile:(NSData*)data dirPath:(NSString*)dirPath fileName:(NSString*)fileName
{
    // 保存先のディレクトリを作成する(※パスを指定してファイルを保存する場合、保存先のパスがないと失敗する）
    [self createDirectory:dirPath];
    
    // 保存先のパス
    NSString *writePath = [NSString stringWithFormat:@"%@/%@",
                           [NSHomeDirectory() stringByAppendingPathComponent:dirPath], fileName];
    
    // ファイルに書き込む
    BOOL result = [data writeToFile:writePath atomically:YES];
    return result;
}

/**
 * 指定したパスのディレクトリを作成する
 */
- (BOOL)createDirectory:(NSString*)path
{
    // 作成するディレクトリのパスを作成
    NSString *dirPath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {
        // ファイルマネージャを作成
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSError *error;
        
        // ディレクトリを作成
        BOOL result = [fileManager createDirectoryAtPath:dirPath
                             withIntermediateDirectories:YES
                                              attributes:nil
                                                   error:&error];
        return result;
    }
    return YES;
}

/**
 * ディレクトリの有無をチェック
 */
- (BOOL)isDirectoryExist:(NSString*)path
{
    // 作成するディレクトリのパスを作成
    NSString *dirPath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {
        return YES;
    }
    return NO;
}

@end
