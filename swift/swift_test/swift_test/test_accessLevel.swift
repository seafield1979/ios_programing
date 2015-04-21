//
//  test_accessLevel.swift
//  swift_test
//
//  Created by B02681 on 2015/04/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    クラス、クラスのプロパティ、クラスのメソッド、構造体、列挙型に外部からのアクセスを制限するためのレベルを設定できる

    設定可能なレベルは
    public
        どこからでもアクセス可能
    internal
        同じモジュール内からにはアクセス可能。具体的には別FrameWorkから取り込まれた場合にアクセスができなくなる。
        よって、FrameWorkのクラスはPublicにすること。
    private
        同じソースファイルからしかアクセスできません。モジュールの使用者から内部構造を隠蔽したい場合等に使用します。
 */

import Foundation


public class CParent {
    init() {
        
    }
    private func test(){
        println("CParent:test()")
    }
    public func test2(){
        println("CParent:test2()")
    }
}

public class CChild1 : CParent {
    override init() {
        
    }
    override public func test(){
        // CParent:testは privateだが同じソース内なのでアクセス可能
        super.test()
    }
}

public class CProperty {
    private(set) var getOnly = 0    // setterがprivateなので、クラス外から値の設定が出来ない
}

public class UNTestAccessLevel {
    init() {
        
    }
    public func test1() {
        println("UNTestAccessLevel:")
        // 同じクラスのメソッドからはprivateメソッドも呼び出し可能
        test_private1()
        
        
    }
    
    private func test_private1() -> String{
        return "hello private"
    }
    
}