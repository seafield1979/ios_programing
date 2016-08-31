//
//  main.swift
//  swift_test
//
//  Created by sunsunsoft on 2015/01/23.
//  Copyright (c) 2015年 SunSunSoft. All rights reserved.
//

import Foundation
import Darwin

func testPrint() {
    print("hello:")
    
    // 変数を埋め込む
    let str1 = "syutaro"
    print("str1:\(str1)")
    
    // カンマ区切りで変数のリストを渡す
    let hoge = "syutaro"
    print("aaa", "bbb", hoge)
    
    // フォーマットする
    let posX : Float = 1.123456789
    let posY : Float = 2.123456789
    print( String(format: "%.4f %.4f", posX, posY))
}

func testBasis() {
    print("test_basis")
    let basis1 : UNTestBasis = UNTestBasis()
    
    let mode = 4
    
    switch mode {
    case 1:
        basis1.test_str()
    case 2:
        basis1.test_switch()
    case 3:
        basis1.test_tuple()
    case 4:
        basis1.test_for()
    case 5:
        basis1.test_tuple2()
    }
}

func testClass() {
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

func testClass2(mode:Int) {
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

func testFunc(mode:Int) {
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

func testArray(mode : Int) {
    print("test_array")
    let array1 : UNTestArray = UNTestArray()
    
    switch mode {
    case 1:
        array1.test1()
    case 2:
        array1.test2()
    case 3:
        array1.test3()
    case 4:
        array1.testMap()
    case 5:
        array1.testFilter()
    case 6:
        array1.testSort()
    case 7:
        array1.testReverse()
    default:
        break
    }
}

func testDictionary(mode: Int) {
    let dictionary1 : UNTestDictionary = UNTestDictionary()
    
    let ret = dictionary1.test1()
    print("\(ret)")
}

func testString(mode : Int) {
    let string1 = UNTestString()
    
    switch mode {
    case 1:
        string1.test1()
    case 2:
        string1.testRegEx()
    case 3:
        string1.testReplace()
    default:
        break
    }
}

func testOptional(mode: Int){
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

func testEnum(mode : Int) {
    let enum1 = UNTestEnum()
    
    switch mode {
    case 1:
        enum1.test1()
    default:
        break;
    }
}

func testStruct(mode:Int) {
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

func testProperty(mode:Int) {
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

func testARC(){
    let arc : UNTestARC = UNTestARC()
    arc.test1()
}


func testExtension() {
    let ext1 : UNTestExtension = UNTestExtension()
    ext1.test1()
}

func testProtocol(mode:Int) {
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

func testNested() {
    let nest : UNTestNested = UNTestNested()
    
    nest.test1()
}

func testGenerics(mode: Int) {
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

func testOverload(mode:Int) {
    let overload : UNTestOverloadOperator = UNTestOverloadOperator()
    overload.test1()
}

//
// subscriptのテスト
// hoge[1] のような書き方をした時に自前の処理を行うことができる
func testSubscript(mode:Int) {
    
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
func getInput() -> String {
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
    let command = getInput()

    switch command {
        case "basis":
            testBasis()
            break
        case "class":
            testClass()
        case "class1":
            testClass2(1)
        case "class2":
            testClass2(2)
        case "class3":
            testClass2(3)
        case "func":
            testFunc(1)
        case "func2":
            testFunc(2)
        case "func3":
            testFunc(3)
        case "func4":
            testFunc(4)
        case "func5":
            testFunc(5)
        case "array1":
            testArray(1)
        case "array2":
            testArray(2)
        case "array3":
            testArray(3)
        case "dic":
            testDictionary(1)
        case "enum":
            fallthrough
        case "enum1":
            testEnum(1)
        case "enum2":
            testEnum(2)
        case "extension":
            fallthrough
        case "ext":
            testExtension()
        case "filter":
            testArray(5)
        case "map":
            testArray(4)
        case "opt1":
            testOptional(1)
        case "opt2":
            testOptional(2)
        case "opt3":
            testOptional(3)
        case "opt4":
            testOptional(4)
        case "opt5":
            testOptional(5)
        case "sort":
            testArray(6)
        case "string1":
            testString(1)
        case "string2":
            testString(2)
        case "string3":
            testString(3)
        case "struct":
            testStruct(1)
        case "struct2":
            testStruct(2)
        case "property":
            testProperty(1)
        case "property2":
            testProperty(2)
        case "protocol1":
            fallthrough
        case "prot1":
            testProtocol(1)
        case "protocol2":
            fallthrough
        case "prot2":
            testProtocol(2)
        case "protocol3":
            fallthrough
        case "prot3":
            testProtocol(3)
        case "reverse":
            testArray(7)
        case "subscript1":
            testSubscript(1)
            break
        case "subscript2":
            testSubscript(2)
            break
        case "arc":
            testARC()
        case "nest":
            testNested()
        case "generics":
            testGenerics(1)
        case "generics2":
            testGenerics(2)
        case "overload":
            testOverload(1)
        case "exit":
            breakWhile = true
        default:
            print("\(command) isn't test name")
    }
}
