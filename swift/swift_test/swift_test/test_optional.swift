//
//  test_optional.swift
//  swift_test
//
//  Created by B02681 on 2015/03/03.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    Optional型のサンプル
    通常の変数はnilを代入できないため、nilを代入するためにOptional型を使用する

*/

import Foundation

class UNTestOptional {
    
    // declear variables
    var _optInt : Int?
    var _optStr : String?
    
    // init
    init(){
        _optInt = nil
        _optStr = nil
    }
    
    // accessor
    var optInt:Int? {
        get {
            return _optInt
        }
        set(int1) {
            _optInt = int1
        }
    }
    var optStr:String? {
        get {
            return _optStr
        }
        set(str1) {
            _optStr = str1
        }
    }
    
    // method
    func test1() {
        optInt = nil        // OK!
        optStr = nil        // OK!
        
        println("1:\(optStr) \(optInt)")
        
        optInt = 100
        optStr = "hello"
        
        println("2:\(optStr) \(optInt)")
    }
    
    // アンラップのあれこれ
    func test2() {
        var a: Int = 1
        println(a + 2) // -> 3
        
        // Optional型をそのまま使用しようとしてエラーになる例
        var b: Int? = 1
        //println(b + 2) // -> Value of optional type 'Int?' not unwrapped; did you mean to use '!' or '?'?
        
        // Optional型はアンラップすれば使用できる
        // !でアンラップしてみる
        var c : String? = "100"
        println("3: \(c!.toInt())")     // OK
        
        // でもnilが入ったOptional変数を !でアンラップすると実行時エラーになる
        var d : String? = nil
        //println("4:\(d!.toInt())")      // 実行時にエラーになる
        
        // nilが入った変数は?でアンラップするといい感じ
        // ?でアンラップすることをoptional Chainingという
        var e : String? = nil
        println("4: \(e?.toInt())")     // OK nilが返る
        e = "123"
        println("5: \(e?.uppercaseString)")
        
        /*
            e?.uppercaseString は 内部でこんな動き(optional chaining)をしている
            e をアンラップする
            uppercaseString メソッドを呼ぶ
            uppercaseString メソッドが String 型を返す
            String 型を optional 型にラップする
            Optional<String> 型を返す
        */
        var f : String? = nil
        var f2 : String? = f?.uppercaseString
        println("6: \(f2)")
    }
    
    func test3() {
        // implicitly unwrapped optional 型のテスト
    }
}
