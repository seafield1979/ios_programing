//
//  ViewController.swift
//  httpConnectTest
//
//  Created by Shusuke Unno on 2016/09/10.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, NSURLSessionTaskDelegate, NSURLSessionDataDelegate {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var textView1: UITextView!
    
    private let pickerTitles: NSArray = [
        "hoge1","hoge2", "hoge3", "hoge4"
    ]
    
    var responseData : NSMutableData! = nil
    
    func button1Tapped(button : UIButton) {
        print(picker1.selectedRowInComponent(0))
        
        let testNo = picker1.selectedRowInComponent(0)
        
        switch (testNo) {
        case 0:
            test1()
        case 1:
            print("")
        case 2:
            print("")
        case 3:
            print("")
        default:
            break
        }
    }
    
    // MARK: test
    func test1() {
        // 送信したいURLを作成し、Requestを作成します。
        let url = NSURL(string:"http://sunsunsoft.com/test/hoge1.php")
        let request = NSURLRequest(URL: url!)
        
        // NSURLSessionConfigurationでhttp通信を接続
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration();
        let session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
            
        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request)
        task.resume()
    }
    
    func saveDataToFile(data : NSData, fileName : String) {
        // Documentsフォルダを読み込む
        if let dir = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true ).first as String?
        {
            print(dir)
            let filePath = dir + "/" + fileName
            
            // ファイルに書き込む
            data.writeToFile( filePath, atomically: false )
        }
    }
    
    func initViews() {
        button1.addTarget(self, action: #selector(self.button1Tapped(_:)), forControlEvents: .TouchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()

        picker1.delegate = self
        picker1.dataSource = self
        
    }
    
    // MARK: NSURLSessionDelegate
    /**
     * HTTPリクエストのデリゲートメソッド(データ受け取り初期処理)
     */
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void)
    {
        let httpResponse = response as! NSHTTPURLResponse;
        
        responseData = NSMutableData()
        
        // Headerの情報の確認
        if (httpResponse.statusCode == 200) {
            
            completionHandler(NSURLSessionResponseDisposition.Allow);   // 続ける
            
        } else {
            // error.code = -999で終了メソッドが呼ばれる
            completionHandler(NSURLSessionResponseDisposition.Cancel);  // 止める
        }
    }
    
    /**
     * HTTPリクエストのデリゲートメソッド(受信の度に実行)
     */
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        responseData!.appendData(data)
    }
    
    /**
     * HTTPリクエストのデリゲートメソッド(完了処理)
     */
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if let _error = error {
            print(_error)
        }
        else {
            let str = String(NSString(data: responseData, encoding:NSUTF8StringEncoding)!)
            textView1.text = str
            print(str)
            // ファイルに保存してみる
            saveDataToFile(responseData, fileName: "hoge.txt")
        }
    }
    
    // MARK: UIPickerViewDataSource
    // pickerに表示する列数を返すデータソースメソッド.
    // (実装必須)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }

    //pickerに表示する行数を返すデータソースメソッド.
    // (実装必須)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerTitles.count
    }
    
    // MARK: UIPickerViewDelegate
    // pickerに表示する値を返すデリゲートメソッド.
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerTitles[row] as? String
    }
    
    // pickerが選択された際に呼ばれるデリゲートメソッド.
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print("row: \(row)\n value: \(pickerTitles[row])")
    }
}

