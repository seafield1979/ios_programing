//
//  test_accessLevel2.swift
//  swift_test
//
//  Created by B02681 on 2015/04/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import Foundation

public class CChild2 : CParent {
    override init() {
        
    }
    public func test(){
        // CParent:testは privateなので別のソースからはアクセス不可
        // super.test()     CParent:testはprivateなのでエラー
        
        // CParent:test2は publicなので別のソースからもアクセス可能
        super.test2()
    }
}
