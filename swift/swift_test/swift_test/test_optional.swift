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

    nilが入る変数を使用したい場合はOptional型か Implicitly unwrapeed Optional型を使用する
    Optional型 (nilを代入できる、使用時は!でアンラップする必要がある)
        宣言  var str : String? = "123"
        参照  str!

    Implicitly unwrapped Optional型 (nilを代入できる、使用時にアンラップする必要は無いがnilが入っているとエラーになるため、nilが入っている可能性がある場合は ?? でnilの時の置き換わる値を設定する必要がある）
        宣言  var str : String!
        参照  str

    nilの入る変数を使う一番間簡単な方法
        Optional型の変数を宣言
            var str : String? = nil
        変数を使用する
            println(str?.toInt())       // nilでも大丈夫
            str = "100"
            println(str?.toInt())       // nil以外でも大丈夫
*/

import Foundation

class UNTestOptional {
    
    // declear variables
    var optInt : Int?
    var optStr : String?
    
    // init
    init(){
        optInt = nil
        optStr = nil
    }

    
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
        println("23: \(c!.toInt())")     // OK
        
        // でもnilが入ったOptional変数を !でアンラップすると実行時エラーになる
        var d : String? = nil
        //println("4:\(d!.toInt())")      // 実行時にエラーになる
        
        // nilが入った変数は?でアンラップするといい感じ
        // ?でアンラップすることをoptional Chainingという
        var e : String? = nil
        println("24: \(e?.toInt())")     // OK nilが返る
        e = "123"
        println("25: \(e?.uppercaseString)")
        
        /*
            e?.uppercaseString は 内部でこんな動き(optional chaining)をしている
            e をアンラップする
            uppercaseString メソッドを呼ぶ
            uppercaseString メソッドが String 型を返す
            String 型を optional 型にラップする
            Optional<String> 型を返す
        */
        var f : String? = nil
        var f2 : String? = f?.uppercaseString       // ?を使用すると出力(String)をOptional型にラップしてから返す
        println("26: \(f2)")
    }
    
    func test3() {
        // implicitly unwrapped optional 型のテスト
        // implicitly unwrapped optional型は自動的にアンラップされる
        var str1 : String! = "hoge"
        println("31: \(str1.uppercaseString)")
        
        // でも nilの場合はエラーになってしまう
        str1 = nil
        //println("32: \(str1.uppercaseString)")      // ランタイムエラー
        
        // implicity unwrapped optional型はnilのときエラーになるじゃん、だめじゃん
        // ってときは ?? 演算子を使うと nilのときに別の値を返すようにできるYO
        var str2 : String! = "1"
        println((str2 ?? "2").toInt())      // str2はnilでないので 1が出力される
        str2 = nil
        println((str2 ?? "2").toInt())        // str2はnilなので 2が出力される
        
    }
    
    /*
     * オプショナル変数を簡単に使用する方法です
     */
    func test4() {
        println("UNTextOptional:test4")

        // 宣言時に?をつけて、参照時も?をつける。これが一番簡単
        // 参照時に?をつけるとnilのときとnil以外のときでエラーにならずに値が取り出せる
        var str : String? = nil
        println(str?.toInt())       // nilでも大丈夫
        str = "100"
        println(str?.toInt())       // nil以外でも大丈夫
        println(str!.toInt())       // 強制的にアンラップする
        
        // ?を使用せずに値を参照したい場合は自分でnilチェックする
        var str2 : String? = nil
        if str2 != nil {
            println("str2:\(str2)")
        } else {
            println("str2 is nil")
        }
        
        str2 = "hello"
        if str2 != nil {
            println("str2:\(str2)")
        } else {
            println("str2 is nil")
        }
    }
    
    //MARK: オプショナル連鎖
    // ?をつけてオプショナル変数がnilを返せるようにできる。これを連結させて複数のnilをとる可能性のある変数を１行にまとめることが出来る
    class optionalConnect1 {
        var Str : String?
        init(str : String?){
            Str = str;
        }
    }
    class optionalConnect2 {
        var Str1 : String?
        var connect1 : optionalConnect1?
        init(str : String?){
            Str1 = str
        }
    }
    func test5() {
        println("UNTextOptional:test5")
        var connect2 : optionalConnect2 = optionalConnect2(str:nil)
        print("test1")
        connect2.connect1 = nil
        if let Str1 = connect2.connect1?.Str? {
            println("connect2.connect1.Str \(Str1)")
        } else {
            println("connect2.connect1.Str doesn't exist")
        }
        
        print("test2")
        connect2.connect1 = optionalConnect1(str: "hoge")
        if let Str1 = connect2.connect1?.Str? {
            println("connect2.connect1.Str \(Str1)")
        } else {
            println("connect2.connect1.Str don't exist")
        }
        
    }
}
