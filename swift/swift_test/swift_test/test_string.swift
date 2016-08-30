//
//  test_string.swift
//  swift_test
//
//  Created by Shusuke Unno on 2016/08/30.
//  Copyright © 2016年 sunsunsoft. All rights reserved.
//

import Foundation

//
// 正規表現クラス
// http://qiita.com/coa00@github/items/ae9c38dc92f3626dcd19
//
class Regexp {
    let internalRegexp: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        do {
            self.internalRegexp = try NSRegularExpression(pattern: pattern, options: [.CaseInsensitive])
        } catch let error as NSError {
            print(error.localizedDescription)
            self.internalRegexp = NSRegularExpression()
        }
    }
    
    func isMatch(input: String) -> Bool {
        let matches = self.internalRegexp.matchesInString( input, options: [], range:NSMakeRange(0, input.characters.count) )
        return matches.count > 0
    }

    func matches(input: String) -> [String]? {
        let nsInput = input as NSString
        if self.isMatch(input) {
            var results = [String]()
            if let matches = internalRegexp.firstMatchInString(nsInput as String, options: NSMatchingOptions(), range: NSMakeRange(0, input.characters.count))
            {
                for i in 0...matches.numberOfRanges - 1 {
                    results.append(nsInput.substringWithRange(matches.rangeAtIndex(i)))
                }
            }
            return results
        }
        return nil
    }
}

class UNTestString
{
    func test1() {
        // 文字列の長さ
        let str = "hoge123"
        print(str.characters.count)
    }
    
    // 正規表現テスト
    func testRegEx() {
        let pattern = "(hoge1) (hoge2)"
        let str = "hoge1 hoge2"
        
        let ret:[String] = Regexp(pattern).matches(str)! //http以下を取得
        print ("--- matches ---")
        for str in ret {
            print(str)
        }
    }
    
    // 正規表現を使った文字列の置換
    func testReplace() {
        let pattern = "\\[test\\|([a-z0-9]+)\\|([a-z0-9]+)\\]"
        let content2 = "[test|hoge|hoge123] [test|huge|huge456]"
        let replace = "found : $1 : $2"
        let replaceString = content2.stringByReplacingOccurrencesOfString(
            pattern,
            withString: replace,
            options: NSStringCompareOptions.RegularExpressionSearch,
            range: nil)
        print(replaceString)
    }
}