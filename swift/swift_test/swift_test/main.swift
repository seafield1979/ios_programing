//
//  main.swift
//  swift_test
//
//  Created by B02681 on 2015/01/23.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import Foundation
import Darwin

func test_print() {
    println("hello:")
    
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
    basis1.test_for()
//    basis1.test_tuple2()
}

func test_class() {
    println("test_class")
    var class1 : UNClassTest = UNClassTest(str1: "ok", str2: "ng")
    println (class1.test1())

}

func test_class2(mode:Int) {
    var class1 : UNTestClassAdvance = UNTestClassAdvance()
    
    switch mode {
    case 1:
        class1.test1()
    case 2:
        class1.test2()
    case 3:
        class1.test3()
    default:
        break
    }
}

func test_func(mode:Int) {
    println("test_func mode:\(mode)")
    
    var func1 : UNTestFunc = UNTestFunc()
    switch mode {
    case 1:
        func1.test1()
    case 2:
        func1.test2()
    case 3:
        func1.test3()
    case 4:
        func1.test4()
    case 5:
        func1.test5()
    default:
        break
    }
}

func test_array(mode : Int) {
    println("test_array")
    var array1 : UNTestArray = UNTestArray()
    
    switch mode {
    case 1:
        var ret = array1.test1()
    case 2:
        var ret = array1.test2()
    case 3:
        array1.test3()
    default:
        println()
    }
}

func test_dictionary(mode: Int) {
    var dictionary1 : UNTestDictionary = UNTestDictionary()
    
    var ret = dictionary1.test1()
    println("\(ret)")
}

func test_optional(mode: Int){
    var optional1 : UNTestOptional = UNTestOptional()
    
    switch mode {
    case 1:
        optional1.test1()
    case 2:
        optional1.test2()
    case 3:
        optional1.test3()
    case 4:
        optional1.test4()
    case 5:
        optional1.test5()
    default:
        break
    }
}

func test_enum(mode : Int) {
    let enum1 = UNTestEnum()
    
    switch mode {
    case 1:
        enum1.test1()
    default:
        break;
    }
}

func test_struct(mode:Int) {
    var struct1 : UNTestStruct = UNTestStruct()
    
    switch mode {
    case 1:
        struct1.test1()
    case 2:
        struct1.test2()
    default:
        break
    }
}

func test_property(mode:Int) {
    var property : UNTestProperty = UNTestProperty()
    
    switch mode {
    case 1:
        property.test1()
    case 2:
        property.test2()
    default:
        break
    }
}

func test_ARC(){
    var arc : UNTestARC = UNTestARC()
    arc.test1()
}


func test_extension() {
    var ext1 : UNTestExtension = UNTestExtension()
    ext1.test1()
}

func test_protocol(mode:Int) {
    var prot1 : UNTestProtocol = UNTestProtocol()
    switch mode {
    case 1:
        prot1.test1()
    case 2:
        prot1.test2()
    default:
        break;
    }
}

/*
 * コンソールでユーザーの入力を取得する
 */
func input() -> String {
    println("\nplease input test name! ")

    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    var strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}


var breakWhile = false
while !breakWhile {
    let command = input()

    switch command {
        case "basis":
            test_basis()
            break
        case "class":
            test_class()
        case "classa1":
            test_class2(1)
        case "classa2":
            test_class2(2)
        case "classa3":
            test_class2(3)
        case "func":
            test_func(1)
        case "func2":
            test_func(2)
        case "func3":
            test_func(3)
        case "func4":
            test_func(4)
        case "func5":
            test_func(5)
        case "array1":
            test_array(1)
        case "array2":
            test_array(2)
        case "array3":
            test_array(3)
        case "dic":
            test_dictionary(1)
        case "enum1":
            test_enum(1)
        case "enum2":
            test_enum(2)
        case "extension":
            fallthrough
        case "ext":
            test_extension()
        case "opt1":
            test_optional(1)
        case "opt2":
            test_optional(2)
        case "opt3":
            test_optional(3)
        case "opt4":
            test_optional(4)
        case "opt5":
            test_optional(5)
        case "struct":
            test_struct(1)
        case "struct2":
            test_struct(2)
        case "property":
            test_property(1)
        case "property2":
            test_property(2)
        case "protocol1":
            fallthrough
        case "prot1":
            test_protocol(1)
        case "protocol2":
            fallthrough
        case "prot2":
            test_protocol(2)
        case "arc":
            test_ARC()
        case "exit":
            breakWhile = true
        default:
            println("\(command) isn't test name")
    }
}
