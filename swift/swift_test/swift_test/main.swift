//
//  main.swift
//  swift_test
//
//  Created by sunsunsoft on 2015/01/23.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//

import Foundation
import Darwin

func test_print() {
    print("hello:")
    
    // 変数を埋め込む
    let str1:String = "syutaro"
    print("str1:\(str1)")
    
    // カンマ区切りで変数のリストを渡す
    let hoge:String = "syutaro"
    print("aaa", "bbb", hoge)
}

func test_basis() {
    print("test_basis")
    let basis1 : UNTestBasis = UNTestBasis()
    basis1.test_str()
//    basis1.test_switch()
//    basis1.test_tuple()
//    basis1.test_for()
//    basis1.test_tuple2()
}

func test_class() {
    print("test_class")
    let class1 : UNClassTest = UNClassTest(str1: "ok", str2: "ng")
    print (class1.test1())

    // オブジェクトからクラス名を取得
    print("dynamicType")
    print( NSStringFromClass(class1.dynamicType))
    
    // クラスの配列
    var classes : [UNClassTest] = [];
    for index in 1...10 {
        let class1 : UNClassTest = UNClassTest(str1: "hoge \(index)", str2: "hage")
        classes.append(class1)
    }
    
    var cnt : Int = 0
    for class1 in classes {
        print("classess[\(cnt)] is " + class1.str1)
        cnt += 1
    }
}

func test_class2(mode:Int) {
    let class1 : UNTestClassAdvance = UNTestClassAdvance()
    
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
    print("test_func mode:\(mode)")
    
    let func1 : UNTestFunc = UNTestFunc()
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
    print("test_array")
    let array1 : UNTestArray = UNTestArray()
    
    switch mode {
    case 1:
        let ret = array1.test1()
    case 2:
        let ret = array1.test2()
    case 3:
        array1.test3()
    default:
        print("")
    }
}

func test_dictionary(mode: Int) {
    let dictionary1 : UNTestDictionary = UNTestDictionary()
    
    let ret = dictionary1.test1()
    print("\(ret)")
}

func test_optional(mode: Int){
    let optional1 : UNTestOptional = UNTestOptional()
    
    switch mode {
    case 1:
        optional1.test1()
    case 2:
        optional1.test2()
    case 3:
        optional1.test3()
    case 4:
        optional1.test4()
//    case 5:
        //optional1.test5()
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
    let struct1 : UNTestStruct = UNTestStruct()
    
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
    let property : UNTestProperty = UNTestProperty()
    
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
    let arc : UNTestARC = UNTestARC()
    arc.test1()
}


func test_extension() {
    let ext1 : UNTestExtension = UNTestExtension()
    ext1.test1()
}

func test_protocol(mode:Int) {
    let prot1 : UNTestProtocol = UNTestProtocol()
    switch mode {
    case 1:
        prot1.test1()
    case 2:
        prot1.test2()
    case 3:
        prot1.test3()
    default:
        break;
    }
}

func test_nested() {
    let nest : UNTestNested = UNTestNested()
    
    nest.test1()
}

func test_generics(mode: Int) {
    let generics : UNTestGenerics = UNTestGenerics()
    
    switch mode {
    case 1:
        generics.test1()
    case 2:
        generics.test2()
    default:
        break
    }
}

func test_overload(mode:Int) {
    let overload : UNTestOverloadOperator = UNTestOverloadOperator()
    overload.test1()
}

func test_subscript(mode:Int) {
    
    if mode == 1 {
        let sample = SubscriptSample()
        sample[0] = "happy_ryo"
        sample[1] = "crazy_ryo"
        print(sample[0])
        print(sample[1])

        let test1 = UNTestSubscript()
        test1[0] = "hoge"
        test1[0] = "hage"
        print(test1[0])
        print(test1[1])
    }
    else if mode == 2 {
        print("kuku")
        let kuku = UNTestSubscript2()
        for i:Int in 1...9 {
            for j:Int in 1...9 {
                print(kuku[i,j].description + " ", terminator: "")
            }
            print("")   // 改行
        }
    }
}

/*
 * コンソールでユーザーの入力を取得する
 */
func input() -> String {
    print("\nplease input test name! ")

    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

// プリプロセッサーテスト
hoge1()

var breakWhile = false
while !breakWhile {
    let command = input()

    switch command {
        case "basis":
            test_basis()
            break
        case "class":
            test_class()
        case "class1":
            test_class2(1)
        case "class2":
            test_class2(2)
        case "class3":
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
        case "enum":
            fallthrough
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
        case "protocol3":
            fallthrough
        case "prot3":
            test_protocol(3)
        case "subscript1":
            test_subscript(1)
            break
        case "subscript2":
            test_subscript(2)
            break
        case "arc":
            test_ARC()
        case "nest":
            test_nested()
        case "generics":
            test_generics(1)
        case "generics2":
            test_generics(2)
        case "overload":
            test_overload(1)
        case "exit":
            breakWhile = true
        default:
            print("\(command) isn't test name")
    }
}
