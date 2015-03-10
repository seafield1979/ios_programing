//
//  main.swift
//  swift_test
//
//  Created by B02681 on 2015/01/23.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import Foundation
import Darwin

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

func test_array(mode : Int) {
    println("test_array")
    var array1 : UNTestArray = UNTestArray()
    if mode == 1 {
        var ret = array1.test1()
    } else if mode == 2 {
        var ret = array1.test2()
    }
}

func test_dictionary(mode: Int) {
    var dictionary1 : UNTestDictionary = UNTestDictionary()
    
    var ret = dictionary1.test1()
    println("\(ret)")
}

func test_optional(){
    var optional1 : UNTestOptional = UNTestOptional()
//    optional1.test1()
//    optional1.test2()
    optional1.test3()
}

/*
 * コンソールでユーザーの入力を取得する
 */
func input() -> String {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    var strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

let command = input()

switch command {
    case "basis":
        test_basis()
        break
    case "class":
        test_class()
    case "func":
        test_func()
    case "array1":
        test_array(1)
    case "array2":
        test_array(2)
    case "dic":
        test_dictionary(1)
    case "opt":
        test_optional()
    default:
        println("other")
}

