//
//  test_struct.swift
//  swift_test
//
//  Created by B02681 on 2015/04/07.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    構造体
    主にデータを保持するために特化したクラス。
    機能的には継承、デストラクタが使用できないクラス。
 */

import Foundation

class UNTestStruct {
// MARK: 自分でイニシャライザを用意する
    struct Enemy {
        var x : Float
        var y : Float
        var name : String
        var birth : NSDate?     // オプショナル
        init(){
            x = 0
            y = 0
            name = "no name"
            birth = nil
        }
        func description() {
            println("x:\(x) y:\(y) name:\(name) birth:\(birth)")
        }
    }
    var enemy : Enemy = Enemy()
    
    init(){
        enemy.x = 10
        enemy.y = 20
        enemy.name = "angry bird"
        enemy.birth = NSDate()
    }
    
    func test1(){
        println("----- struct1 -----")
        println(enemy)
        enemy.description()
    }
    
// MARK: test2 自動で生成されたイニシャライザを使用する
    struct Enemy2 {
        var x : Float
        var y : Float
        var name : String
        var birth : NSDate?     // オプショナル
        func description() {
            println("x:\(x) y:\(y) name:\(name) birth:\(birth)")
        }
    }
    
    func test2() {
        println("----- struct2 -----")
        var enemy2 : Enemy2 = Enemy2(x:12, y:34, name:"donky", birth:NSDate())
        enemy2.description()
    }
}
