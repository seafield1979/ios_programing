//
//  test_array.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
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
    let array6 : [[Int]] = [[1,2],[3,4]]        // 多次元配列
    let array7 : [Int]          // 空の配列
    
    //メソッド
    init() {
        self.array1 = [1,2,3,4,5]
        self.array2 = ["1","2","3","4","5"]
        self.array7 = Array(count:10, repeatedValue: 0)
    }
    
    func test1() -> String {
        var retStr : String = ""
        // 全要素を参照 高速列挙
        for i : Int in self.array1 {
            retStr += i.description
        }
        
        // 多次元配列の参照
        print("multi array")
        for i in 0...1 {
            for j in 0...1 {
                print(array6[i][j])
            }
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
        print("\(self.array1[2])")
        
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
            print("for:%d", i)
        }
        
        return ""
    }
    
    func test3() {
        // 混合型の配列から指定の方の値だけを抜き出す
        var ks : [AnyObject] = []
        var ki : [AnyObject] = []
        let array: [AnyObject] = ["abc", 1, "def", 2, "ghi", 3]
        
        //for var i = 0; i < array.count; i+=1 {
        for value in array {
            // String
            if let string = value as? String {
                ks.append(string)
            }
            // Int
            if let int1 = value as? Int {
                ki.append(int1)
            }
        }
        print("test3_1: \(ks)")
        print("test3_1: \(ki)")
        
        
        // その２
        let array2: [Any] = ["abc", 1, "def", 2, "ghi", 3]
        let k2 = array2.filter{v in v is String}
        print("test3_2: \(k2)")
        
        // その３ 配列の要素を指定の値で初期化
        let count = Array(count: 100, repeatedValue: 100)
        let repeated : [AnyObject] = Array(count: 10, repeatedValue : "hoge")
        print("test3_3: \(count)")
        print("test3_3: \(repeated)")
    }
    

}