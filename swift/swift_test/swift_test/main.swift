//
//  main.swift
//  swift_test
//
//  Created by B02681 on 2015/01/23.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import Foundation

println("Hello, World!")

func test_print() {
    println("hello")
    
    // 変数を埋め込む
    let str1:String = "syutaro"
    println("str1:\(str1)")
    
    // カンマ区切りで変数のリストを渡す
    let hoge:String = "syutaro"
    println("aaa", "bbb", hoge)
}

func test_basis() {
    println("test_basis")
    var basis1 : UNTestBasis = UNTestBasis()
    
//    basis1.test_switch()
//    basis1.test_tuple()
//    basis1.test_for()
    basis1.test_tuple2()
}

func test_class() {
    println("test_class")
    var class1 : UNClassTest = UNClassTest(str1: "ok", str2: "ng")
    println (class1.getset())

}

func test_func() {
    println("test_func")
    var func1 : UNTestFunc = UNTestFunc()
    func1.test1()
}

test_print()

let mode = "func"   
switch mode {
    case "basis":
        test_basis()
        break
    case "class":
        test_class()
    case "func":
        test_func()
    default:
        println("other")
}

test_print();
