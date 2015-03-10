//
//  test_array.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    配列 Array
    var で宣言したArrayはMutable
    let で宣言したArrayはImmutable

    高速列挙はObjCと同じ感じで使用できる
    配列の中にいろいろな型を混ぜてもOK
    結合が簡単 append(), +=[]
 */

import Foundation

class UNTestArray{
    // プロパティ
    var array1 : [Int]   // もしくは Array<Int>
    var array2 : [String]  // もしくは Array<String>
    let array3 : [Int] = [1,2,3]
    let array4 : [String] = ["a","b","c","d","e"];
    let array5 : Array<Any> = [1,2,"aaa"]            // 型を混ぜてもOK
    
    //メソッド
    init() {
        self.array1 = [1,2,3,4,5]
        self.array2 = ["1","2","3","4","5"]
    }
    
    func test1() -> String {
        var retStr : String = ""
        // 全要素を参照 高速列挙
        for i : Int in self.array1 {
            retStr += i.description
        }
        return retStr
    }
    
    func test2() -> String {
        // 出力
        self.array1.display()
        self.array2.display()
        self.array3.display()
        self.array4.display()
        self.array5.display()
        
        // 要素参照
        println("\(self.array1[2])")
        
        // 要素を追加
        self.array1.append(1)       // １つだけ追加
        self.array1 += [5,6,7]      // まとめて追加
        self.array1.insert(100, atIndex: 3)     // 途中に挿入
        self.array1.display()
        
        // 要素の削除
        self.array1.removeAtIndex(0)
        self.array1.removeLast()
        self.array1.display()
        
        // イテレータとしてforループをまわす
        for i in [1,2,3] {
            println("for:%d", i)
        }
        
        return ""
    }

}