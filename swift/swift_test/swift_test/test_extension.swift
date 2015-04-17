//
//  test_extension.swift
//  swift_test
//
//  Created by B02681 on 2015/04/17.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    既存のクラスを拡張できる。Objective-Cのカテゴリーのようなもの。
    IntやString等の基本クラスも拡張できる
    プロパティは追加できない（算出型プロパティは可能）
    
    拡張の方法
    extension 拡張元のクラス名 {
        func メソッドの定義
    }
*/

import Foundation

extension Int {
    // 16進数
    var hex: String {
        return String(self, radix: 16)
    }
    // 8進数
    var oct: String {
        return String(self, radix: 8)
    }
    // 2進数
    var bin: String {
        return String(self, radix: 2)
    }
}

extension String {
    var dao: String {
        return self + "dao"
    }
}

// イニシャライザを拡張
// パーソン
struct Person2 {
    let name: String        // 名前
    var email: String       // メールアドレス
    var age: Int            // 年齢
}
extension Person2 {
    init(name:String){
        self.init(name:name, email:"", age:18)
    }
    func description(){
        println("name:\(self.name) email:\(self.email) age:\(self.age)")
    }
    var description2:String {
        return "name:" + self.name + "email:" + self.email + "age:" + self.age.description
    }
    
    // enumを追加してみる
    enum Type {
        case Hoge, Hage, Mage
        func japanese() -> String {
            switch(self) {
            case .Hoge:
                return "ほげ"
            case .Hage:
                return "ハゲ"
            case .Mage:
                return "まげ"
            }
        }
    }
    // ageの値によって分類する算出プロパティ
    var type : Type {
        if (age < 20) {
            return Type.Hoge
        } else if (age < 40) {
            return Type.Mage
        } else {
            return Type.Hage
        }
    }
}


class UNTestExtension {
    init(){
        
    }
    
    func test1() {
        println("UNTestExtension:test1")
        
        
        println("---- 1 ----")
        println(256.hex)
        println(256.oct)
        println(256.bin)
        println("syutaro".dao)
        
        println("---- 2 ----")
        var person : Person2 = Person2(name: "syutaro")
        println(person.description())
        println(person.description2)
        
        println("---- 3 ----")
        person.age = 40
        println(person.type.japanese())
    }
}