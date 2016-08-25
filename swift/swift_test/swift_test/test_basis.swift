//
//  test_basis.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
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
        let hoge2:String = "hello" + hoge1
        let int2:Int = 100 + int1
        print("hoge2 \(hoge2) int2:\(int2)")
    }
    
    // MAKR: 文字列
    /*
         文字列
     */
    func test_str() {
        
        // 文字列の連結
        let str : String = "hoge" + "hoge2" + "hoge3"
        print(str)
    }
    
    // MARK: IF
    /*
        if文
     */
    func test_if() {
        
        var hoge : Int = 1
        
        hoge = 0
        if hoge == 1 {
            print("hoge == 1")
        } else if hoge == 2 {
            print("hoge == 2")
        } else {
            print("hoge else")
        }
        
//        if hoge = 1 {  <= エラー
//            println("hoge == 1")
//        }
//        if hoge { <- エラー
//            
//        }
        
        // オブジェクトのnil判定
        let hoges:String? = nil
        if hoges == nil {
        //if hoges {        <- エラー。nilかどうかで判定できない。BOOL値を返さないといけない。
            print("hoge == nil")
        }
        else {
            print("hoge != nil")
        }
    }
    
    func test_for() {
        //・基本
        //C言語のforループ
        print("----- for1 -----")
        for var cnt = 0; cnt < 10; cnt++ {
            print("cnt:\(cnt)")
        }
        
        //・範囲指定 (tupleを使用)
        print("----- for2 -----")
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        //・高速列挙 (要素数を繰り返す)
        print("----- for3 -----")
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }
        
        //・index省略
        print("----- for4 -----")
        for _ in 1...3 {
            // 何らかの処理を3回実施します
            print("hogehoge")
        }
        
        // 多重ループを一気に抜ける
        print("----- for5 -----")
        for_i: for i in 1...5 {
            for j in 1...5 {
                print("i=\(i) j=\(j)")
                if i == 2 && j == 2 {
                    print("break for_i")
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
        print("----- case1 -----")
        var hoge:Int = 5
        switch hoge {
        case 1:
            print("1だよ")
        case 2,3:
            print("2か3だよ")
        case 4...10:
            print("4から10だよ")
        default:
            break
        }
        
        // 文字列
        print("----- case2 -----")
        let hoges:String = "tomato"
        switch hoges{
        case "banana":
            print("ばなな")
        case "tomato":
            print("とまと")
        case "cucumber":
            print("きゅうり")
        default:
            break
        }
        
        // break、fallthrough
        print("----- case3 -----")
        hoge = 1
        switch hoge {
        case 1:
            print("1")
            fallthrough
        case 2:
            print("2")
            break
        case 3:
            print("3")
        default:
            break
        }
    }
    
    // MARK: タプル
    // タプル tuple::
    func test_tuple() {
        // 名前なしタプル
        let item = ("ジュース", 100, 0.08, 108)
        print("商品名=\(item.0), 税抜き価格=\(item.1)円, 消費税=\(item.2 * 100)%, 税込み価格=\(item.3)円")
        // 商品名=ジュース, 税抜き価格=100円, 消費税=8.0%, 税込み価格=108円
        
        // 複数の変数をまとめて宣言するタプル
        let (name, price, tax, priceWithTax) = ("ジュース", 100, 0.08, 108)
        print("商品名=\(name), 税抜き価格=\(price)円, 消費税=\(tax * 100)%, 税込み価格=\(priceWithTax)円")
        
        // 名前つきタプル
        let item2 = (name:"ジュース", price:100, tax:0.08, priceWithTax:108)
        print("商品名=\(item2.name), 税抜き価格=\(item2.price)円, 消費税=\(item2.tax * 100)%, 税込み価格=\(item2.priceWithTax)円")
    }
    
    // メソッドの戻り値を複数持たせる
    func test_tuple2() {
        // 引数が１つの場合は要素が１つのタプルを返している
        func inner1() -> (Int) {
            return 1
        }
        
        var ret1 = inner1()
        print("ret1: \(ret1)")
        
        // 引数が２つのタプル
        func inner2() -> (Int, String) {
            return (2, "syutaro2")
        }
        
        var ret2 = inner2()
        print("ret2: \(ret2.0) \(ret2.1)")
        
        // 名前つきタプル
        func inner3() -> (number:Int, name:String) {
            return (number:3, name:"syutaro3")
        }
        let ret3 = inner3()
        print("ret3: \(ret3.number) \(ret3.name)")
        
    }
}