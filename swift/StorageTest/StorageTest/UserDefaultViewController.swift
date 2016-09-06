//
//  UserDefaultViewController.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2016/09/06.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
//  NSUserDefaultを使用したデータの保存、読み込み

import UIKit

class UserDefaultViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func test1ButtonTapped(sender: AnyObject) {
        setData("hoge", value: "123456789")
        
        
        messageLabel.text = "save hoge=123456789"
    }
    @IBAction func test2ButtonTapped(sender: AnyObject) {
        let str : String? = getDataByKey("hoge")
        if let _str = str {
            label1.text = _str
        }
        else {
            label1.text = "none"
        }
        messageLabel.text = "get data key=hoge"
    }
    @IBAction func test3ButtonTapped(sender: AnyObject) {
        deleteDataByKey("hoge")
        
        messageLabel.text = "delete data key=hoge"
    }
    @IBAction func test4ButtonTapped(sender: AnyObject) {
        showAllData()
        
        messageLabel.text = "show all data"
    }
    
    // key = value のデータを作成 or 更新する
    func setData(key : String, value : String) {
        // 「ud」というインスタンスをつくる。
        let ud = NSUserDefaults.standardUserDefaults()
        
        // キーidに「taro」という値を格納。（idは任意の文字列でok）
        ud.setObject(value, forKey: key)
        
        ud.synchronize()
    }
    
    // keyのデータを読み込む
    func getDataByKey(key : String) -> String?
    {
        let ud = NSUserDefaults.standardUserDefaults()
        
        let value : AnyObject! = ud.objectForKey(key)
        
        return value as? String
    }
    
    // keyのデータをStringで読み込む
    func getStringByKey(key : String) -> String?
    {
        let ud = NSUserDefaults.standardUserDefaults()
        
        let value = ud.stringForKey(key)
        
        return value
    }
    
    // keyのデータを削除する
    func deleteDataByKey(key : String)
    {
        let ud = NSUserDefaults.standardUserDefaults()
        
        // キーidの値を削除
        ud.removeObjectForKey(key)
    }
    
    // 全てのデータを表示する
    func showAllData() {
        let ud = NSUserDefaults.standardUserDefaults()
        
        // 設定値すべてを取得　※ システムで用意された設定値も出力されます
        let dictionary : NSDictionary =  ud.dictionaryRepresentation()
        print(dictionary)
    }
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
