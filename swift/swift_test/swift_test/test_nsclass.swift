//
//  test_nsclass.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/09/06.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
//

import Foundation

class UNTestNSClass {
    
    // NSArrayとかNSDictionaryのテスト
    func test1() {
        let nsarray = NSArray(array: ["hoge", "hoge2", "hoge3"])
        
        print(nsarray.dynamicType)
        
        for value in nsarray {
            if value is String {
                print(value)
            }
        }
    }
    
    // NSDataのテスト
    func test2() {
        // StringからNSDataを作成する
        let str1 = "hogehoge"
        let data1 = str1.dataUsingEncoding(NSUTF8StringEncoding)
        
        // ファイルに書き込んでみる
        if let dir : NSString = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first
        {
            print(dir)  // /Users/[ユーザー名]/Documents
        }
    }
    init() {
        
    }
}