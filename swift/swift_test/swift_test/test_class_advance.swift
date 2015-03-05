//
//  test_class_advance.swift
//  swift_test
//
//  Created by B02681 on 2015/03/05.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    更に進んだクラスの使い方
    ・継承
        継承で親クラスの機能を引き継いだ小クラスを作れる

    ・オーバーライド
    ・タイプ・プロパティとタイプ・メソッド
 */
import Foundation

// MARK: - 継承
class Parent{
    var position : CGRect
    init() {
        self.position = CGRectMake(0, 0, 0, 0)
    }
}

class Child : Parent{
    var name : String?
    
    override init() {
        super.init()
        self.name = ""
    }
}

// MARK: - オーバーライド
class Parent2{
    init(){
    }
    func hoge(){
    }
}

class Child2 : Parent2 {
    override init(){
        super.init()
    }
    override func hoge(){
    
    }
}

// MARK: - オーバーライド禁止(@final)
class Parent3{
    final func hoge(){
        
    }
}

class Child3 : Parent3 {
//    override func hoge(){     // <- オーバーライド禁止に引っかかってエラーんなる
//        
//    }
}

// MARK: - タイププロパティとタイプメソッド