//
//  test_enum.swift
//  swift_test
//
//  Created by UnnoShusuke on 2015/01/31.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    C言語のenumのようなもの
    
    // 信号機
    enum Signal {
        case Blue       // 青
        case Yellow     // 黄
        case Red        // 赤
    }
    
    // １行に書く場合
    enum Signal {
        case Blue, Yellow, Red
    }

    // 型を指定できる
    enum Signal : Int {
        case Blue       // 青
        case Yellow     // 黄
        case Red        // 赤
    }

    // メソッドを定義できる
    enum Signal {
        case Blue
        case Yellow
        case Red
        func meaning() -> String {
            switch(self) {
            case .Blue:
                return "進め"
            case .Yellow:
                return "注意"
            case .Red:
                return "止れ"
            }
        }
    }
*/

import Foundation


class UNTestEnum {
    // 信号機
    enum Signal {
        case Blue       // 青
        case Yellow     // 黄
        case Red        // 赤
    }
    
    // １行に書く場合
    enum Signal2 {
        case Blue, Yellow, Red
    }
    
    // 型を指定できる
    enum Signal3 : Int {
        case Blue = 1   // 青
        case Yellow     // 黄
        case Red        // 赤
    }
    
    // メソッドを定義できる
    enum SignalF {
        case Blue
        case Yellow
        case Red
        func meaning() -> String {
            switch(self) {
            case .Blue:
                return "進め"
            case .Yellow:
                return "注意"
            case .Red:
                return "止れ"
            }
        }
    }
    
    init () {
        
    }
    
    func test1() {
        println("UNTestEnum.test1")
        // 参照
        println(Signal3.Blue)
        
        // 関数呼び出し
        let s = SignalF.Yellow
        println("meaning:" + s.meaning())
        
    }
    
    func test2(mode : Int) {
        // 関連値
        
        /* 乗り物 */
        enum Vehicle {
            case Bicycle         // 自転車
            case Motorbike(Int)  // バイク（排気量）
            case Car(Int, Bool)  // 車（排気量, オートマ）
        }
        
        var vehicle = Vehicle.Bicycle
        if mode == 1 {
            vehicle = .Motorbike(750)
        } else {
            vehicle = .Car(1600, true)
        }
        
        
        switch vehicle {
        case .Bicycle:
            println("自転車")
        case .Motorbike(let engine) where engine <= 50:
            println("オートバイ:原付")
        case .Motorbike(let engine) where engine <= 125:
            println("オートバイ:小型")
        case .Motorbike(let engine) where engine <= 400:
            println("オートバイ:中型")
        case .Motorbike(let engine):
            println("オートバイ:大型")
        case .Car(let engine, let automatic) where engine <= 660:
            println("軽自動車:" + (automatic ? "オートマ" : "マニュアル"))
        case .Car(let engine, let automatic):
            println("普通車 \(engine)cc:" + (automatic ? "オートマ" : "マニュアル"))
        }
    }
    
}