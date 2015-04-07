//
//  test_property.swift
//  swift_test
//
//  Created by B02681 on 2015/04/07.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    プロパティのサンプル
    Swiftのプロパティの特徴
    ・ゲッターとセッターを宣言できる
    ・ゲッターとセッターは変数無しでも宣言できる
    ・ゲッターのみのプロパティを宣言できる
    ・値の監視が出来る（値が変更されたときに処理を実行する）
*/

import Foundation


class UNTestProperty {
    init() {
        _str1 = ""
        age = 0
        name = ""
    }
    
    // ただのプロパティ(getter/setterのないプロパティ)
    var age : Int
    var name : String
    
    // 基本的なgetter/setter（変数を返すだけ）
    var _str1 : String
    var str1 : String {
        get {
            return "str1 is " + _str1;
        }
        set(str1) {
            _str1 = str1
        }
    }
    
    // 計算型(変数を持たない）
    // getterだけの場合は getスコープを省略できる
    var int1 : Int {
        return 100 + 200
    }
    
    // プロパティの監視
    // プロパティの値が変更前、変更後にメソッドが呼ばれる
    // ※値が変わらない場合でも呼ばれる
    var age2 : Int = 0 {
        willSet {
            println("willSet \(self.age2) -> \(newValue)")
        }
        didSet {
            println("didSet \(oldValue) -> \(self.age2)")
        }
    }
    
    var static_int1 : Int = 0
    
    func test1() {
        println("----- property1 -----")
        age = 100
        name = "syutaro"
        println("age:\(age) name:\(name)")
        
        println("----- property2 -----")
        println("int1:\(int1)")
        
        println("----- property3 -----")
        age2 = 100
        age2 = 101
        age2 = 101
    }

// MARK: test2 シングルトン
    // Swiftはクラス変数が持てないのでクラスメソッドとStaticな構造体を組み合わせて実現する
    class var sharedInstance : UNTestProperty {
        struct Static {
            static let instance : UNTestProperty = UNTestProperty()
        }
        return Static.instance
    }
    var singleStr : String = "Single Tong!"

    func test2() {
        println("----- property4 -----")
        println("Singlenton: \(UNTestProperty.sharedInstance.singleStr)")
    }
}

