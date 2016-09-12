//
//  ViewController.swift
//  httpConnectTest
//
//  Created by Shusuke Unno on 2016/09/10.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, NSURLSessionTaskDelegate {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var textView1: UITextView!
    
    private let pickerTitles: NSArray = [
        "http 同期",
        "http 非同期",
        "AFNetwork GET",
        "AFNetwork POST",
        "AFNetwork JSON",
        "AFNetwork JSON2",
        "AFNetwork JSON3"
    ]
    
    let testGetURL = "http://sunsunsoft.com/test/ios/test_get.php"
    let testPostURL = "http://sunsunsoft.com/test/ios/test_post.php"
    let testJsonURL = "http://sunsunsoft.com/test/ios/test.json"
    let testJsonURL2 = "http://sunsunsoft.com/test/ios/test_json.php"
    let testJsonURL3 = "http://sunsunsoft.com/test/ios/test_json2.php"
    
    var responseData : NSMutableData! = nil
    
    func button1Tapped(button : UIButton) {
        let testNo = picker1.selectedRowInComponent(0)
        
        switch (testNo) {
        case 0:
            testSynchronous()
        case 1:
            testAsynchronous()
        case 2:
            testAFNetworkingGET()
        case 3:
            testAFNetworkingPOST()
        case 4:
            testAFNetworkingJSON()
        case 5:
            testAFNetworkingJSON2()
        case 6:
            testAFNetworkingJSON3()
        default:
            break
        }
    }
    
    // MARK: test
    // 非同期型http通信
    // 必要なタイミングでdelegateメソッドが呼ばれれる
    func testSynchronous() {
        // 送信したいURLを作成し、Requestを作成します。
        let url = NSURL(string:testGetURL)
        let request = NSURLRequest(URL: url!)
        
        // NSURLSessionConfigurationでhttp通信を接続
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration();
        let session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
            
        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request)
        task.resume()
    }
    
    // 同期型http通信
    // 通信が終わるまで関数から出てこない
    func testAsynchronous() {
        // create the url-request
        let urlString = testGetURL
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        
        // set the method(HTTP-GET)
        request.HTTPMethod = "GET"
        
        // use NSURLSessionDataTask
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { data, response, error in
            if (error == nil)
            {
                // サブスレッドで textView1にアクセスすると落ちるのでメインスレッドで処理する
                self.dispatch_async_main {
                    let result = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                    self.textView1.text = result as String
                }
            } else {
                print(error)
            }
        })
        task.resume()
    }
    
    // メインスレッド
    func dispatch_async_main(block: () -> ()) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    // バックグラウンド
    func dispatch_async_global(block: () -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
    }
    
    //レスポンス取得後の処理
    func getHttp(res:NSURLResponse?,data:NSData?,error:NSError?)
    {
        let response:NSString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
        print(response)
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
    
    // GET送信
    // プレーンテキスト取得
    func testAFNetworkingGET() {
        
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        // GETメッセージを作成
        let getStr = testGetURL + "?param1=hoge&param2=mage"
        manager.GET(getStr, parameters: nil,
                    success: {(operation, responsedObject) in
                        let str : NSString = NSString(data:responsedObject as! NSData, encoding:NSUTF8StringEncoding)!
                        print("response: \(str)")
        },
            
                    failure: { (operation, error) in
                        print("error: \(error)")
        }
        )
    }
    
    // POSTで送信
    // プレーンテキスト受信
    func testAFNetworkingPOST() {
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer = AFHTTPResponseSerializer()
        let param:Dictionary<String, String> = ["param1" : "value1", "param2" : "value2"]
        
        manager.POST(testPostURL, parameters: param,
                     success: {
                        (operation: AFHTTPRequestOperation!, responsedObject:AnyObject!) in
                        let str : NSString = NSString(data:responsedObject as! NSData, encoding:NSUTF8StringEncoding)!
                        print("response: \(str)")

            }, failure: {
                (operation, error) in
                print("Error: \(error)")
        })
    }
    
    // JSON受信
    func testAFNetworkingJSON() {
        //リクエスト
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        
        manager.GET(testJsonURL, parameters: nil,
                    success: {(operation: AFHTTPRequestOperation!, responsedObject: AnyObject!) in
                        print("Success!!")
                        
                        // responsedObject を表示。ただ、Dictionary型なので存在しない要素にアクセスしようとしようとすると落ちる
                        print(responsedObject)
                        print(responsedObject["a"])
                        print(responsedObject["b"])
                        // print(responsedObject[0])        // 落ちる
                        
                        // SwiftyJSONオブジェクトに変換
                        let json = JSON(responsedObject)
                        print(json)
                        print(json["a"])
                        print(json["b"])
                        print(json[0])           // 落ちない
            },
                    failure: {(operation, error) in
                        print("Error!!")
            }
        )
    }
    
    // テキスト形式JSON受信
    func testAFNetworkingJSON2() {
        //リクエスト
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer = AFHTTPResponseSerializer()  // textを受け取る
        
        let param:Dictionary = ["param1" : "value1", "param2" : "value2",
                                 "array1" : [1,2,3,4,5],
                                 "dic1" : ["key1" : "123", "key2" : "hoge"]]
        
        manager.POST(testJsonURL2, parameters: param,
                    success: {(operation: AFHTTPRequestOperation!, responsedObject: AnyObject!) in
                        print("Success!!")
                        let str : NSString = NSString(data:responsedObject as! NSData, encoding:NSUTF8StringEncoding)!
                        print("response: \(str)")
                        
                        // print(responsedObject["param1"]);  responsedObjectはJSONオブジェクトになっていないのでエラー

                        // SwiftyJSONオブジェクトに変換
                        // phpが返すのは json_encode したJSON文字列
                        if let response = responsedObject {
                            let json = JSON(data:response as! NSData)
                            print(json["param1"])
                            print(json["param2"])
                            print(json["array1"])
                            print(json[0])           // 落ちない
                        }
            },
                    failure: {(operation, error) in
                        print("Error!!")
            }
        )
    }
    
    // POSTしたデータをJSONオブジェクト形式で受信
    func testAFNetworkingJSON3() {
        //リクエスト
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer = AFHTTPRequestSerializer()  // 文字列形式で送る
        manager.responseSerializer = AFJSONResponseSerializer()  // JSONオブジェクトを変換して受け取る
        
        let param:Dictionary = ["param1" : "value1", "param2" : "value2",
                                "array1" : [1,2,3,4,5],
                                "dic1" : ["key1" : "123", "key2" : "hoge"]]
        
        manager.POST(testJsonURL3, parameters: param,
                     success: {(operation: AFHTTPRequestOperation!, responsedObject: AnyObject!) in
                        print("Success!!")
                        
                        print(responsedObject["param1"]);
                        
                        // SwiftyJSONオブジェクトに変換
                        // phpが返すのは json_encode したJSON文字列
                        if let response = responsedObject {
                            let json = JSON(response)
                            print(json["param1"])
                            print(json["param2"])
                            print(json["array1"])
                            print(json["dic1"])
                        }
            },
                     failure: {(operation, error) in
                        print("Error!!")
                        print(error)
            }
        )
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
    
    // MARK: NSURLSessionTaskDelegate
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
        //print("row: \(row)\n value: \(pickerTitles[row])")
    }
}

