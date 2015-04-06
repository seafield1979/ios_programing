//
//  test_function.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import Foundation


class UNTestFunc {
    
    init() {
        
    }
    
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
        println("UNTextFunction:test2()")
        
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
        println("UNTextFunction:test3()")
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
        
        if let f = func1 {
            self.add(10,b:20)
            let ret = f(20, 10)
            println("ret:\(ret)")
        }
    }
    
}