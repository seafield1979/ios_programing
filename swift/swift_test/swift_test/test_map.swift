//
//  test_map.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/08/30.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
// mapのテスト
// mapはどんなときに使用するのか？
// 　　配列の全要素に何かしらの処理を行い新しい値を取得する

import Foundation

class UNTestMap
{
    func test1(){
        // 全要素を10倍した新しい配列を取得
        let array1 = [1,2,3,4,5]
        let newArray = array1.map{ $0 * 10 }
        for val in newArray {
            print(val)
        }
        
        // 結果をもともとの配列で受け取る
        var array2 = [1,2,3,4,5]
        array2 = array2.map{ $0 * 100 }
        for val in array2 {
            print(val)
        }
        
        // 文字列の配列を処理する
        var array3 = ["hoge1", "hoge2", "hoge3"]
        array3 = array3.map{ $0 + " is good!" }
        for str in array3 {
            print(str)
        }
    }
    init() {
        
    }
}