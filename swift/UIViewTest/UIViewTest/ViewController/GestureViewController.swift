//
//  GestureViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/27.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    var gestureView : UIView?
    
    func tapGesture(gestureRecognizer: UITapGestureRecognizer){
        // タップされた view を取得する
        let view : UIView? = gestureRecognizer.view!
        
        // タップviewの色を変える (Red <=> Blue)
        if(view!.backgroundColor  == UIColor.redColor()) {
            view!.backgroundColor = UIColor.blueColor()
        }
        else {
            view!.backgroundColor = UIColor.redColor()
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Viewを追加
        self.gestureView = UIView(frame: CGRect(x:0, y:0, width:100, height:100))
        gestureView!.backgroundColor = UIColor.redColor()
        self.view.addSubview(gestureView!)
        
        // Viewにタッチイベントを追加
        self.gestureView!.userInteractionEnabled = true
        
        //ジェスチャーを作成
        let aSelector = #selector(self.tapGesture(_:))
        let recognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:aSelector);
        
        //ジェスチャーをUIViewオブジェクトに登録する
        self.gestureView!.addGestureRecognizer(recognizer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
