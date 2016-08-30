//
//  test_filter.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/08/30.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
//
// filterのテスト
// filterは配列要素の条件絞り込みに使用する


import Foundation

class UNTestFilter {
    func test1() {
        // 指定の値以上の値のみ残す
        let array1 = [1,2,3,4,5,6,7,8,9,10]
        let array2 = array1.filter { $0 > 5 }
        for val in array2 {
            print(val)
        }
        
        // 指定のフォーマットにあった文字列のみ残す
        
    }
}