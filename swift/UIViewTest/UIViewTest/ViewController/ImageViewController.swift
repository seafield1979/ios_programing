//
//  ImageViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/31.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// UIImageViewのテスト
//    UIImage(named:)で 画像を生成
//    UIImageView(image:)で 画像のViewを生成
//    UIImageViewの画像を変更
//

import UIKit

class ImageViewController: UIViewController {

    var imageView1 : UIImageView?
    var imageView2 : UIImageView?
    
    @IBAction func button1Tapped(sender: AnyObject) {
        let image = UIImage(named: "image/miro_s.jpg")
        if let imageOK = image {
            imageView1!.image = imageOK
            imageView1!.frame.size = imageOK.size
        }
    }
    @IBAction func button2Tapped(sender: AnyObject) {
        let image = UIImage(named: "image/ume_r.png")
        if let imageOK = image {
            imageView1!.image = imageOK
            imageView1!.frame.size = imageOK.size
        }
    }
    @IBAction func button3Tapped(sender: AnyObject) {
        let size = imageView1!.frame.size
        imageView1!.frame.size = CGSizeMake( size.width / 2, size.height / 2 )
    }
    
    // 画像ファイルからUIImageViewを作成する
    func createImageView(pos : CGPoint, imageFile : String) -> UIImageView
    {
        let imageView = UIImageView( image: UIImage(named: imageFile) )
        imageView.frame.origin = pos
        return imageView
    }
    
    // 自前でUIImageViewを作成する
    func createImageView2(pos : CGPoint, size : CGSize) -> UIImageView
    {
        var imgView:UIImageView! = nil
        var img:UIImage! = nil
        
        // ここでRGBAの値を指定(今回は適当に青色にしています)
        let r:Int = 0, g:Int = 0, b:Int = 255
        let alphaValue:CGFloat = 1.0
        
        // UIImageViewを準備(iPadの横向きにフルで取ったとした場合．ご自身の要件に合わせて下さい．)
        imgView = UIImageView(frame:CGRectMake(pos.x, pos.y, size.width, size.height))
        
        // UIImageを自前で準備
        UIGraphicsBeginImageContextWithOptions(imgView.frame.size, false, 0)
        // context生成
        let contextImg:CGContextRef = UIGraphicsGetCurrentContext()!
        // この塗りつぶす領域の大きさを指定
        let rect:CGRect = CGRectMake(0, 0, size.width, size.height)
        //　色をRGBAで指定
        CGContextSetRGBFillColor(contextImg,CGFloat(r) / 255,CGFloat(g) / 255,CGFloat(b) / 255, alphaValue)
        // 指定された領域を塗りつぶす
        CGContextFillRect(contextImg, rect)
        //　現在のcontextの情報取得
        img = UIGraphicsGetImageFromCurrentImageContext()
        //　contextを終了
        UIGraphicsEndImageContext()
        
        // imgをUIImageViewで表示
        imgView.image = img
        imgView.image?.drawInRect(CGRectMake(0, 0, imgView.frame.size.width, imgView.frame.size.height))
        
        return imgView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView1 = createImageView(CGPointMake(0,50.0), imageFile: "image/ume_r.png")
        self.view.addSubview(imageView1!)
        
        imageView2 = createImageView2(CGPointMake(0, 300.0), size: CGSizeMake(150.0, 150.0))
        self.view.addSubview(imageView2!)
    }
}
