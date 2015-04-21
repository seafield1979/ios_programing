//
//  test_protocol.swift
//  swift_test
//
//  Created by B02681 on 2015/04/17.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    プロトコルはそのクラスで実装されるメソッドのセットを定義したもの
    Objective-Cのプロトコルと同じ
    プロトコルをあるクラスに適用すると、そのクラスはプロトコルで定義されたメソッドを定義する必要が生じる
        ➡ Type '[プロトコルを適応したクラス名]' does not conform to protocol '[プロトコル名]'
 */

import Foundation

protocol UNProtocol1 {
    // インターフェイスの定義
    func goForward()
    func goBack()
    func yeah() -> String
    var name : String? {get}
    var middleName : String? {get set}
    // 型メソッド
    class func classFunc1() -> String
}

class UNMovingObject : UNProtocol1 {
    var _name : String?
    var _middleName : String?
    
    init() {
    }
    
    //MARK: UNProtocol1を実装
    func goForward() {
        println("UNMovingObject:goForward")
    }
    func goBack() {
        println("UNMovingObject:goBack")
    }
    func yeah() -> String {
        return "Yeah"
    }
    var name : String? {
        return self._name?
    }
    var middleName : String? {
        get {
            return self._middleName?
        }
        set(_name) {
            self._middleName = _name
        }
    }
    class func classFunc1() -> String {
        return "hohohohohohoho"
    }
    
    var description : String {
        // オプショナル変数とStringは結合できないので
        return "name:" + (self.name ?? "nil") + " middleName:" + (self.middleName ?? "nil")
    }
}

// 本の情報を返すプロトコル
protocol BookInfo {
    var bookName : String {get}
    var title : String {get}
    var author : String {get}
    var description : String {get}
}

class Jump : BookInfo {
    var _title : String
    var _author : String
    
    init(title:String, author:String){
        _title = title
        _author = author
    }
    
    // プロトコルの実装
    var bookName : String {
        return "少年シャソプ"
    }
    var title : String {
        return _title
    }
    var author : String {
        return _author
    }
    var description : String {
        return "bookName:" + bookName + " title:" + title + " author:" + author
    }
}
class Magazine : BookInfo {
    var _title : String
    var _author : String
    
    init(title:String, author:String){
        _title = title
        _author = author
    }
    
    // プロトコルの実装
    var bookName : String {
        return "マガずん!"
    }
    var title : String {
        return _title
    }
    var author : String {
        return _author
    }
    var description : String {
        return "bookName:" + bookName + " title:" + title + " author:" + author
    }
}


protocol GameBoard {
    // subscriptを使用すると hoge[1,2] のように参照できるようになる
    subscript(row: Int, column: Int) -> Int { get set }
}

class UNTestProtocol {
    private var prot1 : UNMovingObject?
    
    init() {
    }
    func test1() {
        println("UNTestProtocol:test1")
        prot1 = UNMovingObject()
        prot1?.goForward()
        prot1?.goBack()
        println(prot1?.description)
    }
    
    // プロトコルの配列にそのプロトコルを実装しているインスタンスを代入する
    func test2() {
        println("UNTestProtocol:test2")
        var book1 : Jump = Jump(title: "とらごんぼーる", author: "鳥山あらき")
        var book2 : Jump = Jump(title: "じゃんがーじゃんがー", author: "冨樫よしたけ")
        var book3 : Magazine = Magazine(title: "銀田一中年の事件簿", author: "ごんべえ")
        var bookList : [BookInfo] = [book1, book2, book3]
        
        for book in bookList {
            println(book.description)
        }
    }
    
    
    // MARK: test3 subscipt 配列のアクセス方法を定義する
    class testGP : GameBoard {
        var board : [Int] = Array(count:8*8, repeatedValue:0)
        subscript(row: Int, column: Int) -> Int {
            get {
                return board[row * 8 + column]
            }
            set {
                board[row * 8 + column] = newValue
            }
        }
    }
    func test3() {
        var gameBoard : testGP = testGP()
        gameBoard[2,2] = 100
        gameBoard[3,3] = 200
        println(gameBoard.board)
    }
}
