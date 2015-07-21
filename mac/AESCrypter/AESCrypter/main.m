//
//  main.m
//  AESCrypter
//
//  Created by B02681 on 2015/07/16.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+AES.h"

NSDictionary* argsToDictionary(int argc, const char * argv[]);

int main(int argc, const char * argv[]) {
    NSLog(@"AES Decrypter!");
    @autoreleasepool {
        NSDictionary *params = argsToDictionary(argc, argv);
        
        if (params[@"file"]) {
            NSString *path = params[@"file"];
            NSData *data = [[NSData alloc]initWithContentsOfFile:path];
            NSData *decryptedData = [data AES128DecryptWithKey:params[@"key"] iv:params[@"iv"]];
            NSString *decryptedStr = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
            if (!decryptedData) {
                NSLog(@"Failed to decrypt!");
            }
            NSLog(@"\n+++++++++++++++++++\n%@\n+++++++++++++++++++", decryptedStr);
        }
    }
    return 0;
}

/**
 * プログラム引数のargv([key=value, key=value ...]を辞書型に変換する
 */
NSDictionary* argsToDictionary(int argc, const char * argv[])
{
    if (argc < 2) {
        return nil;
    }
    NSMutableDictionary *dic = @{}.mutableCopy;
    
    for (int i=0; i<argc - 1; i++) {
        NSString *str = [NSString stringWithUTF8String : argv[i+1]];
        NSInteger pos = [str rangeOfString:@"="].location;
        NSString *key, *value;
        if (pos != NSNotFound) {
            key = [str substringToIndex:pos];
            value = [str substringFromIndex:pos+1];
        }
        if (key && value) {
            dic[key] = value;
        }
    }
    NSLog(@"params=%@", dic);
    
    return dic;
}
