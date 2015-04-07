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

    ・クラスの判定（あるクラスを継承しているかどうか）
        あるクラスを継承しているかを判定するには  as? を使用する
        if let sub1 = object1 as? SubClass {
        }

        もしくは is演算子を使用する
        if sub1 is SubClass {

        }

    ・クラスの判定（特定のクラスかどうか） Objective-cのisMemberOfClass:メソッドと同じ
        if sub1.dynamicType === SubClass.self

    ・同一インスタンスの判定
        var monsterA = Monster()
        monsterA.name = "スライム"
        var monsterB = monsterA

        if monsterA === monsterB {
        println("同じインスタンス")
        }
        if monsterA !== monsterB {
        println("同じインスタンスではない")
        }
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

// MARK: クラス判定
class UNTestClassAdvance
{
    init() {
    }
    
    func test1() {
        // 継承
        println("test_class2")
        var class2 : Child1 = Child1()
        class2.test1()
        
        // オーバーライド
        var class22 : Child2 = Child2()
        class22.test1()
    }
    
    
    func test2() {
        // あるクラスを継承しているかを判定
        println("\nInherit check")
        var array = [Child1(), Parent1(), Parent3()];
        
        for obj in array {
            println("----")
            if obj is Child1 {
                println("obj is Child1")
            }
            if obj is Parent1 {
                println("obj is Parent1")
            }
            if obj is Parent3 {
                println("obj is Parent3")
            }
        }
        
        // 同一インスタンスのチェック
        println("Instance same check")
        var obj1 : AnyObject = array[1];
        for obj in array {
            println("----")
            if obj1 === obj {
                println("obj1 is instance of \(NSStringFromClass(obj.dynamicType))")
            }
        }
        
    }
}


// MARK: - タイププロパティとタイプメソッド