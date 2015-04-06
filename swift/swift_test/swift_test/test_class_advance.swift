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
class Parent1{
    var position : CGRect
    init() {
        self.position = CGRectMake(1, 2, 3, 4)
    }
    func hoge() {
        println("Parent1:hoge")
    }
}

class Child1 : Parent1{
    var name : String?
    
    override init() {
        super.init()
        self.name = ""
    }
    
    func test1() {
        // 親クラスのメンバの参照、メソッドの呼び出し
        self.hoge()
        println("position: \(position)")
    }
}

// MARK: - オーバーライド
/*
    Parent2のinit,hogeを子クラスのChild2でオーバーライドする
 */
class Parent2{
    init(){
        println("Parent2:init")
    }
    func hoge(){
        println("Parent2:hoge")
    }
}

class Child2 : Parent2 {
    override init(){
        super.init()
        println("Child2:init")
    }
    override func hoge(){
        super.hoge()    // 親クラスのメソッドを呼び出す
        println("Child2:hoge")
    }
    func test1() {
        self.hoge()
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