//
//  CGContextViewController.swift
//  MyImageView
//
//  Created by Shusuke Unno on 2016/09/08.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// CGContextを使用したサンプル
/*
 CGContextを使用すると
    画像(UIImage)の描画
    図形(矩形、ライン、円等）の描画
    テキスト(フォント、サイズ指定)の描画
 等を行い、結果をUIImageで取得することができる
 */

import UIKit

class CGContextViewController: UIViewController {

    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var label1: UILabel!
    
    let testTitles = ["DrawImage",
                      "CropImage",
                      "ResizeImage",
                      "ResizeCrop",
                      "DrawRect",
                      "DrawText"]
    
    enum TestMode : Int {
        case DrawImage      // シンプルなUIImageの描画
        case CropImage      // 画像の切り抜き
        case ResizeImage    // 画像のリサイズ(拡大縮小)
        case ResizeCrop     // 画像の切り抜き＆リサイズ
        case DrawRect       // 矩形(長方形)の描画
        case DrawText       // テキストの描画
    }
    
    var imageView : UIImageView?  // 画面に表示中の画像
    
    @IBAction func stepperValueChanged(sender: AnyObject) {
        label1.text = testTitles[Int(stepper1.value)]
    }
    @IBAction func button1Tapped(sender: AnyObject) {
        let _mode = TestMode.init(rawValue: Int(stepper1.value))!
        
        testImage( _mode )
    }
    
    // MARK: Test func
    
    func testImage(mode : TestMode) {
        
        // 現在表示中の imageView を削除
        if let _imageView = self.imageView {
            _imageView.removeFromSuperview()
            self.imageView = nil
        }
        
        // 新しいUIImageを元にimageViewを作成する
        var image : UIImage! = nil
        
        switch mode {
        case .DrawImage:
            image = createImage(UIImage(named: "image/ume.png")!)
            
        case .CropImage:
            image = cropImage(UIImage(named: "image/ume.png")!, x: 50, y: 50, width: 100, height: 100)
            
        case .ResizeImage:
            image = resizeImage(UIImage(named: "image/ume.png")!, width: 200,height: 200)
            
        case .ResizeCrop:
            image = resizeCropImage(UIImage(named: "image/ume.png")!,
                                    srcRect: CGRectMake( 50, 50, 100, 100),
                                    scale: 2.0)
            
        case .DrawRect:
            image = createRectImage(CGSizeMake(200,200))
            
        case .DrawText:
            image = createTextImage("Hoge Hoge")
        }
        
        let imageView = UIImageView(image: image)
        imageView.frame.origin = CGPointMake(50, 100)
        self.view.addSubview(imageView)
        self.imageView = imageView
    }
    
    // MARK: CGContext func
    
    // UIImageをCGContextに描画(画像の描画のみ、コンテキストを取得しない)
    func createImage(image :UIImage) ->UIImage
    {
        // 画像コンテキスト作成(Canvasみたいなもの)
        let imageRect = CGRectMake(0,0,image.size.width,image.size.height)
        
        UIGraphicsBeginImageContext(image.size);
        
        // コンテキストにUIImageを描画
        image.drawInRect(imageRect)

        // コンテキストにUIImageを描画
//        let imageRect2 = CGRectMake(100,100,image.size.width-100,image.size.height-100)
//        image.drawInRect(imageRect2)

        // 出力UIImageを取得
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // コンテキストを解放
        UIGraphicsEndImageContext()
        
        return newImage
    }

    // 一部分を切り抜いた画像を取得
    func cropImage(image: UIImage, x: CGFloat, y: CGFloat, width : CGFloat, height : CGFloat) -> UIImage
    {
        let srcRect = CGRectMake(0,0,image.size.width,image.size.height)
        let cropRect = CGRectMake(x, y, width, height)
        
        // resizeImage にリサイズ済みの画像を生成する
        UIGraphicsBeginImageContext(srcRect.size);
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 切り抜き処理
        let cropRef   = CGImageCreateWithImageInRect(resizeImage.CGImage, cropRect)
        let cropImage = UIImage(CGImage: cropRef!)
        
        UIGraphicsEndImageContext()
        
        return cropImage
    }

    // サイズを変更
    // 元の画像(image)を width, height のサイズに変更する
    // width, height が元の画像より小さいなら縮小、大きいなら拡大される
    func resizeImage(image: UIImage, width : CGFloat, height : CGFloat) -> UIImage
    {
        let srcRect = CGRectMake(0,0,image.size.width,image.size.height)
        
        // resizeImage にリサイズ済みの画像を生成する
        UIGraphicsBeginImageContext(srcRect.size);
        image.drawInRect(CGRectMake(0, 0, width, height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    // リサイズ＆切り抜き
    // 画像(image)を srcRectで切り抜き、 scale倍にリサイズする
    // 処理的にはリサイズしてからそのリサイズ画像の一部分を切り抜いている
    func resizeCropImage(image: UIImage, srcRect : CGRect, scale : CGFloat) -> UIImage
    {
        // resizeImage にリサイズ済みの画像を生成する
        let scaledSize = CGSizeMake(image.size.width * scale, image.size.height * scale)

        UIGraphicsBeginImageContext(scaledSize);
        
        // リサイズ処理
        image.drawInRect(CGRectMake(0, 0, scaledSize.width, scaledSize.height))
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 切り抜き処理
        let cropRect = CGRectMake( srcRect.origin.x * scale,
                                   srcRect.origin.y * scale,
                                   srcRect.size.width * scale,
                                   srcRect.size.height * scale)
        
        let cropRef   = CGImageCreateWithImageInRect(resizeImage.CGImage, cropRect)
        let cropImage = UIImage(CGImage: cropRef!)
        
        UIGraphicsEndImageContext()
        
        return cropImage
    }
 
    // CGContext を使用して矩形描画
    func createRectImage(size : CGSize) -> UIImage
    {
        // コンテキストを開く
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        // コンテキストを得る
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        
        // ■を描画 (CGContextFillRect)
        // この塗りつぶす領域の大きさ
        let rect:CGRect = CGRectMake(0, 0, size.width, size.height)
        //　色をRGBAで指定
        CGContextSetRGBFillColor(context,CGFloat(0) / 255,CGFloat(0) / 255,CGFloat(255) / 255, 1.0)
        // 矩形塗りつぶし
        CGContextFillRect(context, rect)
        
        // コンテキストに描画済の画像を得る
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        // コンテキストを解放
        UIGraphicsEndImageContext()
        
        return newImage
    }

    // CGContextでテキストの描画
    func createTextImage(text : String) -> UIImage
    {
        let size = CGSizeMake(200,50)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        // 描画する文字列の情報を指定する
        // 文字描画時に反映される影の指定
        let shadow = NSShadow()
        shadow.shadowOffset = CGSizeMake(0, -1)
        shadow.shadowColor = UIColor.darkGrayColor()
        shadow.shadowBlurRadius = 0
        
        // 文字描画に使用するフォントの指定
        let font = UIFont.boldSystemFontOfSize(20.0)
        
        // パラグラフ関連の情報の指定
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.Center
        style.lineBreakMode = NSLineBreakMode.ByClipping
        
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: style,
            NSShadowAttributeName: shadow,
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.blackColor()
        ]
        // 文字列を描画する
        text.drawInRect(CGRectMake(0,0,size.width,size.height), withAttributes:textFontAttributes)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testImage(TestMode.DrawImage)
        
        label1.text = testTitles[0]
        stepper1.maximumValue = Double(testTitles.count - 1)
    }
}
