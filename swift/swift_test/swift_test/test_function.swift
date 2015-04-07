//
//  test_function.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
Swiftのメソッドの特徴
・引数に名前が設定できる
・引数に初期値を設定できる
・引数の名前が異なれば、同じ名前のメソッドを宣言できる
・戻り値を複数返せる（タプル（リスト））
・外部引数を使用してObjective-Cみたいに呼び出し側でパラメータの名前を指定できる
・Objective-Cみたいに変数に関数を代入できる。関数の引数に無名関数を渡せる
 */

import Foundation


class UNTestFunc {
    
    func test1() {
        //①引数なし・戻り値なし
        func hello(){
            print("Hello!")
        }
        hello()
        
        //②引数なし・戻り値あり
        func hoge2() -> Int{
            return 100
        }
        hoge2()
        
        //③引数あり・戻り値あり
        func hoge3(num: Int) -> Int{
            return num
        }
        
        println("hoge3: \(hoge3(100))")
        
        //④引数あり（複数）
        func hoge4(a: Int, b: String){
            println(a)
            println(b)
        }
        
        hoge4(100, "テスト")
        
        //⑤引数あり（複数かつ数を指定しない）
        //引数の値は配列として格納される。
        func hoge5(a: Int...){
            println(a[0])
            println(a[1])
        }
        hoge5(100, 200)
        
        //⑥引数あり（初期値を設定）
        func hoge6(a: Int = 100){
            print(a)
        }
        
        println("hoge6")
        hoge6() // => 100
        hoge6(a: 200) // => 200 ※引数にデフォルト値を指定した場合は、引数のラベル名が必要になる！
        
        //⑥引数を使って変数宣言
        //引数のパラメータは、通常定数(let)として扱われるので、値を代入することはできない。
        func hoge62(a: Int){
            //a = 200 // エラー
        }
        
        println("hoge62 : \(hoge62(100))")
        
        //ただし、引数でvar宣言をしてあげるとエラーにならない。
        func hoge63(var a: Int) -> Int{
            a = 200 // OK
            return a
        }
        println("hoge63 : \(hoge63(100))")
        
        //⑦キーワード引数（外部引数）を使う
        //引数の変数名の前に#をつける。これで、呼び出し時に引数の名前を指定できるようになる
        func hoge7(#a: Int, #b: Int, #c: Int){
            println(a, b)
        }
        hoge7(a: 100, b: 200, c:300)
        
        //あまりないと思うが、引数名とは別名で指定したい場合は、以下のように書ける。
        func hoge(num a: Int){
            println(a)
        }
        
        hoge(num: 100)
        
        //⑧戻り値が複数
        //タプルを使用する。
        func compareNumber(arr: [Int]) -> (min: Int, max: Int) {
            var min = minElement(arr)
            var max = maxElement(arr)
            
            return (min, max)
        }
        let ret = compareNumber([1,2,3,4,5])
        println("min: \(ret.min) max:\(ret.max)")
    }

    // MARK: test2
    // text内にcharactersのリストの文字が含まれていたらtrueを返す
    func containsCharacter(text:String, characters:Character ...) -> Bool {
        for ch in characters {
            for t in text {
                if ch == t {
                    println("\(ch) is in the \(text)")
                    return true
                }
            }
        }
        return false
    }

    // 可変引数のテスト
    func test2() {
        println("UNTestFunction:test2()")
        
        containsCharacter("abcdefg", characters: "i") // false
        containsCharacter("abcdefg", characters:"z", "o", "g") // true
    }

    // MARK: test3
    // 関数の型と関数変数
    func add(a : Int, b : Int) -> Int {
        return a + b
    }
    func sub(a : Int, b : Int) -> Int {
        return a - b
    }
    func mul(a : Int, b : Int) -> Int {
        return a * b;
    }
    func div(a : Int, b : Int) -> Int {
        if b == 0 {
            return 0
        }
        return a / b
    }
    func test3() {
        println("UNTestFunction:test3()")
        var mode : Int = 3
        
        var func1 : ((Int, Int) -> Int)? = nil
        switch mode {
        case 1:
            func1 = self.add
        case 2:
            func1 = self.sub
        case 3:
            func1 = self.mul
        case 4:
            func1 = self.div
        default:
            break
        }
        
        var ff1 : Int? = nil
        if ff1 != nil {
            println(ff1!)
        }
        
        if let f = func1 {
        //if func1 != nil {
            let ret = f(20,10)
            println("ret:\(ret)")
        }
    }
    
    
    // MARK:test4 無名関数
    // 関数型の引数を受け取るメソッド
    typealias FuncType = (Int, Int)->Int
    
    func calc1(a : Int, function:FuncType) {
        println(function(a, a))
    }

    func test4() {
        println("UNTestFunction:test4()")
        
        // calc1 に無名関数を渡す
        self.calc1(100, function: {
            (a:Int, b:Int) in
                return a * b
        })
        
        // ちなみに無名関数を渡さない場合は事前に関数型変数に代入しておく
        var add1 : FuncType = {(a : Int, b : Int) in
            return a + b
        }
        self.calc1(33, function: add1)
    }
    
    // MARK:test5 クロージャ
    // スコープ内で宣言され、使用できる範囲が制限された関数。関数の中で関数を宣言できたりする
    func test5() {
        println("UNTestFunction:test5()")
        
        func hello1(a:Int, b:Int) -> Int{
            return a + b * (a + b)
        }
        println("hello1:" + hello1(1,2).description)
        
        let c : Int = 3
        func hello2(a:Int, b:Int) -> Int{
            // 呼び出し元のスコープの変数 (c) を参照できる
            return a + b * (a + b + c)
        }
        
        println("hello2:" + hello2(1,2).description)
    }
}