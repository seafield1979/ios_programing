//
//  test_array.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import Foundation

class UNTestArray{
    // プロパティ
    var array1 : [Int]
    var array2 : [String]
    
    //メソッド
    init() {
        self.array1 = [1,2,3,4,5]
        self.array2 = ["1","2","3","4","5"]
    }
    
    func test1() -> String {
        var retStr : String = ""
        for i : Int in self.array1 {
            retStr += i.description
        }
        return retStr
    }
}