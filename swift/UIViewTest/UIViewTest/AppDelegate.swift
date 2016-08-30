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
    var gestureViewController2 : GestureViewController2?
    var buttonViewController : ButtonViewController?
 
    enum testMode {
        case VC
        case Gesture
        case Gesture2
        case Button
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        let mode = testMode.Button
        
        
        // 最初に表示されるViewControllerを生成
        switch (mode) {
        case .VC:
            self.viewController = ViewController(nibName: "ViewController", bundle: nil)
            
            // Viewの色を変える
            self.viewController!.view.backgroundColor = UIColor.yellowColor()
            window!.rootViewController = viewController
        case .Gesture:
            self.gestureViewController = GestureViewController(nibName: "GestureViewController", bundle: nil)
            
            // Viewの色を変える
            self.gestureViewController!.view.backgroundColor = UIColor.yellowColor()
            window!.rootViewController = self.gestureViewController
        case .Gesture2:
            self.gestureViewController2 = GestureViewController2(nibName: "GestureViewController2", bundle: nil)
            
            // Viewの色を変える
            self.gestureViewController2!.view.backgroundColor = UIColor.yellowColor()
            window!.rootViewController = self.gestureViewController2
        case .Button:
            self.buttonViewController = ButtonViewController(nibName: "ButtonViewController", bundle: nil)
            
            // Viewの色を変える
            self.buttonViewController!.view.backgroundColor = UIColor.whiteColor()
            window!.rootViewController = self.buttonViewController
        }

        window!.makeKeyAndVisible();
        return true
    }
}

