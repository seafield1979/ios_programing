//
//  test_generics.swift
//  swift_test
//
//  Created by B02681 on 2015/04/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    C++のテンプレートのようなもの
    型が違うだけで処理は同じような場合に、ジェネリックでどの型にも対応する処理を作成できる


*/

import Foundation


// MARK:構造体をジェネリクス対応
// 値が重複しない構造体
struct Set<T: Equatable> {      // Equatable は２つの引数が == で比較できるプロトコル
    var items = [T]()
    // 要素数
    var count : Int {
        return items.count
    }
    
    // 要素の追加
    mutating func append(item:T) {
        if !self.contains(item) {
            items.append(item)
        }
    }
    
    // 要素の削除
    mutating func remove(item:T) {
        if let idx = find(items, item) {
            items.removeAtIndex(idx)
        }
    }
    
    // 要素の存在確認
    func contains(item: T) -> Bool {
        return Swift.contains(items, item)
    }
}

class UNTestGenerics {
    init() {
        
    }
    
    func bigger<T:Comparable>(val1: T, val2: T) -> T {
        return val1 > val2 ? val1 : val2
    }
    
    func test1() {
        println("UNTestGenerics:test1")
        println("----- 1 -----")
        var i1 = 10
        var i2 = 20
        println(bigger(i1, val2:i2))
        
        var f1 : Float = 10.0
        var f2 : Float = 20.0
        println(bigger(f1,val2:f2))
        
        var d1 : Double = 10.0
        var d2 : Double = 20.0
        println(bigger(d1, val2:d2))
        
        var s1 : String = "Mickey"
        var s2 : String = "Miffy"
        println(bigger(s1,val2:s2))
    }
    
    /*
     * 構造体のジェネリクス対応
     * いろいろな型で使用できる重複しない配列を作成
     */
    func test2() {
        var party = Set<String>()
        party.append("ルフィ")
        party.append("ゾロ")
        party.append("ナミ")
        party.append("ゾロ")
        println(party.items)
        
        var numbers = Set<Int>()
        numbers.append(10)
        numbers.append(20)
        println(numbers.contains(10))   // true
        println(numbers.items)
    }
    
}
