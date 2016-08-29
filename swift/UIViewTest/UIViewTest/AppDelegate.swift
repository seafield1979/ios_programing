//
//  AppDelegate.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/27.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController : ViewController?
    var gestureViewController : GestureViewController?
 
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        // 最初に表示されるViewControllerを生成
        if (false) {
            self.viewController = ViewController(nibName: "ViewController", bundle: nil)
            
            // Viewの色を変える
            self.viewController!.view.backgroundColor = UIColor.yellowColor()
            window!.rootViewController = viewController
        }
        else {
            self.gestureViewController = GestureViewController(nibName: "GestureViewController", bundle: nil)
            
            // Viewの色を変える
            self.gestureViewController!.view.backgroundColor = UIColor.yellowColor()
            window!.rootViewController = self.gestureViewController
        }

        window!.makeKeyAndVisible();
        return true
    }
}

