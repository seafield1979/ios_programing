//
//  test_dictionary.swift
//  swift_test
//
//  Created by B02681 on 2015/03/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    辞書型 Dictionary
    特徴
        宣言時にキーと値の型を宣言できる。ちなみにObjective-CではキーはNSString,値はオブジェクト型だった
        プリミティブ型(Int, Float等)がそのまま入る
        var で宣言するとMutable, letで宣言するとImmutable
        キーに整数型が使用できるので、配列のような使い方もできる。（もしかしたら内部的にはArrayとDictionaryの違いがないのかもしれない）
    
 */

import Foundation

class UNTestDictionary
{
    init() {
        
    }
    
    func test1() -> String {
        // 宣言 キーと値の型を宣言できる
        var d1 : [String : Int] = ["Apple" : 100, "Orange": 200, "Banana" : 50]
        println(d1)
        
        // 宣言2 型を指定しないでも宣言できる
        var d2 = ["Apple2" : 10000, "Orange2" : 20000, "Banana2" : 5000]
        println(d2)
        
        // 宣言3 型が混在
        var d3 = ["Apple" : 1000, "Orange" : "2000", 100 : 100]
        println( d3["Apple"] )
        println( d3["Orange"] )
        println( d3[100] )          // インデックスでも参照できる。これが出来るのはすごい
        println(d3)
        
        // 値の変更 キーを指定して値を代入する
        var d4 = ["Apple" : 100, "Orange" : 200]
        d4["Apple"] = 120
        d4["Orange"] = 240
        println(d4)
        
        // 要素の削除  nilを代入
        var d5 = ["Apple" : 100, "Orange" : 200]
        d5["Orange"] = nil      // Orangeの要素は消える
        println(d5)
        
        // 辞書型のコピー
        var d6 = ["Apple" : 100, "Orange" : 200]
        var d62 = d6        // d62はd6をコピーしてできた新しいDictionary
        d62["Apple"] = 130  // これで変わるのはd62だけ
        println("d6" + d6.description)
        println("d62" + d62.description)
        
        // キーだけ取得 Array型
        var d7 = ["Apple" : 100, "Orange" : 200]
        println("d7'keys: " + d7.keys.array.description)
        
        // イテレーションでループを回す
        println("d7'values: " + Array(d7.values).description)
        for key in d7.keys {
            println("d7_2 \(key):\(d7[key])")
        }
        
        // イテレーションでループを回す(キーと値を取得)
        for (key, value) in d7 {
            println("d7_3 \(key):\(value)")
        }
        
        return ""
    }
    
    func test2() {
        var d1 : [String : Int]? = nil;
        
        
    }
    
    
}
