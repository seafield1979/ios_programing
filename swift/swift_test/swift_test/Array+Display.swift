//
//  Array+Display.swift
//  swift_test
//
//  Created by B02681 on 2015/02/25.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import Foundation

extension Array {
    func display() {
        println("------")
        for obj in self {
            println(obj)
        }
    }
}