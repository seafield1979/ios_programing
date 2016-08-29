//
//  ButtonViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/29.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
/*
    UIButtonをいろいろ試してみる
        ボタンの文字を変更
        ボタンのデザインを変更
        ボタンを自前の画像に変更
        ボタンの状態を変更
        ボタンが押された時の処理
 */

import UIKit

class ButtonViewController: UIViewController {

    var button1 : UIButton?
    var button2 : UIButton?
    var button3 : UIButton?
    
    
    func tappedButton(sender: AnyObject) {
//        if let button = sender as? UIButton {
//            button.selected = !(button.selected)
//        }
        print("button tapped")
    }
    
    func touchDown(button: UIButton?) {
        button!.setTitle("hoge", forState: .Normal)
    }

    // UIColor から UIImageを作成する
    func createImageFromUIColor(color: UIColor) -> UIImage {
        // 1x1のbitmapを作成
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        // bitmapを塗りつぶし
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        // UIImageに変換
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func createButton(pos : CGPoint) -> UIButton {
        let button = UIButton()
        //表示されるテキスト
        button.setTitle("Tap Me!", forState: .Normal)
        
        //テキストの色
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        //タップした状態のテキスト
        button.setTitle("Tapped!", forState: .Highlighted)
        
        //タップした状態の色
        button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        
        //サイズ
        button.frame = CGRectMake(pos.x, pos.y, 300, 50)
        
        //タグ番号
        button.tag = 1
        
        //配置場所
        button.frame.origin = CGPoint(x: pos.x, y: pos.y)
        
        //背景色(通常時、ハイライト時、選択時)
        button.setBackgroundImage(createImageFromUIColor(UIColor.whiteColor()), forState: UIControlState.Normal)
        button.setBackgroundImage(createImageFromUIColor(UIColor.grayColor()), forState: UIControlState.Highlighted)
        button.setBackgroundImage(createImageFromUIColor(UIColor.orangeColor()), forState: UIControlState.Selected)

        //角丸
        button.layer.cornerRadius = 10
        
        //ボーダー幅
        button.layer.borderWidth = 1
        
        //ボタンをタップした時に実行するメソッドを指定
        button.addTarget(self,action: #selector(self.tappedButton(_:)), forControlEvents:.TouchUpInside)
        //button.addTarget(self,action: #selector(self.touchDown(_:)), forControlEvents:.TouchDown)
        
        return button
    }
    
    // シンプルなボタンを作成
    func createButton2(pos : CGPoint, title : String) -> UIButton
    {
        let button = UIButton(frame: CGRectMake(pos.x, pos.y, 100, 30))
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor( UIColor.grayColor(), forState: UIControlState.Highlighted)
        return button
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // ボタンを生成
        self.button1 = createButton(CGPointMake(0.0, 100.0))
        self.view.addSubview(button1!)
        
        // ボタンを生成
        self.button2 = createButton(CGPointMake(0.0, 200.0))
        self.view.addSubview(button2!)
        
        // ボタンを生成
        self.button3 = createButton2(CGPointMake(0.0, 300.0), title : "hoge")
        self.button3!.addTarget(self,action: #selector(self.tappedButton(_:)), forControlEvents:.TouchUpInside)
        self.view.addSubview(button3!)
        

    }
}
