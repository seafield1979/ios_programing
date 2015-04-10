//
//  test_class.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/29.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
基本的なクラス

クラスの宣言
class クラス名{
    // プロパティ
    var プロパティ名 : 型
    let プロパティ名 : 型

    //メソッド
    init(name: String, number: Int) {
        self.name = name // 引数の変数名とクラスのプロパティを区別するため、selfをつける
        self.number = number // 定数もinitの中なら設定できる
    }

    func hello() -> String {
        return "hello, \(name)"
    }
}

// オブジェクトの生成
var user: User = User(name: "taro", number: 100)

// オブジェクトメソッドの呼び出し
user.hello()


*/

import Foundation

class UNClassTest {
    // property
    var _str1 : String = ""
    var _str2 : String = ""
    
   
    // getter/setter
    var str1 : String {
        get {
            println("str1:get")
            return _str1        // この_str1はstr1とは直接関係ないので、プロパティならなんでもOKだYO
        }
        set(str1){
            println("str1:set")
            _str1 = str1
        }
    }
    var str2 : String {
        get {
            println("str2:get")
            return _str2
        }
        set(str2) {
            println("str2:set")
            _str2 = str2
        }
    }
    
    // getterだけの場合は get のスコープを省略できる
    var str3 : String {
        return "hogehoge str3"
    }
    
    // initializer
    // イニシャライザの前にはfuncは不要
    // 引数なし
    init () {
        _str1 = ""
        _str2 = ""
    }
    // 引数あり
    init (str1: String, str2: String) {
        _str1 = str1
        _str2 = str2
    }
    
    // デイニシャライザ
    deinit {
        // オブジェクト解放時の処理
        println("UNTestClass:deinit")
    }
    
    // method
    func hello() -> String {
        return "UNClassTest str1:\(str1)"
    }
    
    // クラスメソッド
    class func classMethod() {
        // type method implementation goes here
        println("class method!")
    }
    
    // クラス変数（の代用）
    class var classVar : String {
        get {
            return "classVar!";
        }
    }
    
    func test1() {
        println("----- class1 -----")
        str1 = "1"
        str2 = "2"
        println("str1:\(str1) str2:\(str2) str3:\(str3)")
        
        println("----- class2 -----")
        println(UNClassTest.classMethod())
        println(UNClassTest.classVar)
    }
}

