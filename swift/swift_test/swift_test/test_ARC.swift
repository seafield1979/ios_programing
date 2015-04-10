//
//  test_ARC.swift
//  swift_test
//
//  Created by B02681 on 2015/04/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
 ARCのテスト
 ARCはObjective-Cと同じ仕様。アンオウンドというnilにならなくなる属性を追加できる
*/



import Foundation

class UNTestARC {
    var man : Person? = Person(name:"jackson")
    init(){
        man!.drivingLicence = DrivingLicense(number: 12345, holder: man!)
    }
    
    func test1() {
        println("----- ACR1 -----")
        println("license:\(man!.drivingLicence)")
    }
}

/* パーソンクラス */
class Person {
    let name: String    // 氏名
    var drivingLicence: DrivingLicense? // 運転免許証
    init(name: String) {
        self.name = name
    }
    deinit {
        println("バーソン（\(self.name)）の破棄")
    }
}

/* 運転免許証クラス */
class DrivingLicense {
    var number: Int64           // 免許証番号
    unowned var holder: Person  // 所有者
    init(number: Int64, holder: Person) {
        self.number = number
        self.holder = holder
    }
    deinit {
        println("運転免許証（\(self.number)）の破棄")
    }
}
