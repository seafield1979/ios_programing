//
//  test_basis.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
  Swiftの基本構文のテスト


 */

import Foundation


class UNTestBasis {
    init(){
        
    }
    
    func test1() {
        // 変数の宣言
        var hoge1:String = "hoge1"
        var int1:Int = 100
        
        // 変数の代入
        hoge1 = "hoge2"
        int1 = 200
        
        // 変数の参照
        var hoge2:String = "hello" + hoge1
        var int2:Int = 100 + int1
        println("hoge2 \(hoge2) int2:\(int2)")
    }
    
    // MARK: IF
    /*
        if文
     */
    func test_if() {
        
        var hoge : Int = 1
        
        hoge = 0
        if hoge == 1 {
            println("hoge == 1")
        } else if hoge == 2 {
            println("hoge == 2")
        } else {
            println("hoge else")
        }
        
//        if hoge = 1 {  <= エラー
//            println("hoge == 1")
//        }
//        if hoge { <- エラー
//            
//        }
        
        // オブジェクトのnil判定
        var hoges:String? = nil
        if hoges == nil {
        //if hoges {        <- エラー。nilかどうかで判定できない。BOOL値を返さないといけない。
            println("hoge == nil")
        }
        else {
            println("hoge != nil")
        }
    }
    
    func test_for() {
        //・基本
        //C言語のforループ
        println("----- for1 -----")
        for var cnt = 0; cnt < 10; cnt++ {
            println("cnt:\(cnt)")
        }
        
        //・範囲指定 (tupleを使用)
        println("----- for2 -----")
        for index in 1...5 {
            println("\(index) times 5 is \(index * 5)")
        }
        
        //・高速列挙 (要素数を繰り返す)
        println("----- for3 -----")
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            println("Hello, \(name)!")
        }
        
        //・index省略
        println("----- for4 -----")
        for _ in 1...3 {
            // 何らかの処理を3回実施します
            println("hogehoge")
        }
        
        // 多重ループを一気に抜ける
        println("----- for5 -----")
        for_i: for i in 1...5 {
            for j in 1...5 {
                println("i=\(i) j=\(j)")
                if i == 2 && j == 2 {
                    println("break for_i")
                    break for_i
                }
            }
        }
    }
    
    // MARK: SWITCH ~ CASE
    /*
        switch~caseのテスト
    */
    func test_switch() {
        // 基本
        println("----- case1 -----")
        var hoge:Int = 5
        switch hoge {
        case 1:
            println("1だよ")
        case 2,3:
            println("2か3だよ")
        case 4...10:
            println("4から10だよ")
        default:
            break
        }
        
        // 文字列
        println("----- case2 -----")
        var hoges:String = "tomato"
        switch hoges{
        case "banana":
            println("ばなな")
        case "tomato":
            println("とまと")
        case "cucumber":
            println("きゅうり")
        default:
            break
        }
        
        // break、fallthrough
        println("----- case3 -----")
        hoge = 1
        switch hoge {
        case 1:
            println("1")
            fallthrough
        case 2:
            println("2")
            break
        case 3:
            println("3")
        default:
            break
        }
    }
    
    // MARK: タプル
    // タプル tuple::
    func test_tuple() {
        // 名前なしタプル
        let item = ("ジュース", 100, 0.08, 108)
        println("商品名=\(item.0), 税抜き価格=\(item.1)円, 消費税=\(item.2 * 100)%, 税込み価格=\(item.3)円")
        // 商品名=ジュース, 税抜き価格=100円, 消費税=8.0%, 税込み価格=108円
        
        // 複数の変数をまとめて宣言するタプル
        let (name, price, tax, priceWithTax) = ("ジュース", 100, 0.08, 108)
        println("商品名=\(name), 税抜き価格=\(price)円, 消費税=\(tax * 100)%, 税込み価格=\(priceWithTax)円")
        
        // 名前つきタプル
        let item2 = (name:"ジュース", price:100, tax:0.08, priceWithTax:108)
        println("商品名=\(item2.name), 税抜き価格=\(item2.price)円, 消費税=\(item2.tax * 100)%, 税込み価格=\(item2.priceWithTax)円")
    }
    
    // メソッドの戻り値を複数持たせる
    func test_tuple2() {
        // 引数が１つの場合は要素が１つのタプルを返している
        func inner1() -> (Int) {
            return 1
        }
        
        var ret1 = inner1()
        println("ret1: \(ret1)")
        
        // 引数が２つのタプル
        func inner2() -> (Int, String) {
            return (2, "syutaro2")
        }
        
        var ret2 = inner2()
        println("ret2: \(ret2.0) \(ret2.1)")
        
        // 名前つきタプル
        func inner3() -> (number:Int, name:String) {
            return (number:3, name:"syutaro3")
        }
        var ret3 = inner3()
        println("ret3: \(ret3.number) \(ret3.name)")
        
    }
}