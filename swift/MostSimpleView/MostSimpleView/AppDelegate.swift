//
//  AppDelegate.swift
//  MostSimpleView
//
//  Created by Shusuke Unno on 2016/08/25.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
// 超シンプルなアプリ
// xibもstoryboardも使わないで、windowに自前で作成したViewControllerをセットしているだけ
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        // 最初に表示されるViewControllerを生成
        let viewController = UIViewController()
        
        // Viewの色を変える
        viewController.view.backgroundColor = UIColor.yellowColor()
        
        window!.rootViewController = viewController
        window!.makeKeyAndVisible();
        return true
    }
}

