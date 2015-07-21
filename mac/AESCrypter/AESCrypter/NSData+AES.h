//
//  NSData+AES.h
//  Pods
//
//  Created by B02681 on 2015/07/02.
//
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

// http://d.hatena.ne.jp/aka_mythosil/20111017/1318873155
// http://blog.fusic.co.jp/archives/859


@interface NSData (AES)
- (NSData *)AES128crypte:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;
@end
