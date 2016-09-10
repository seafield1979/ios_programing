//
//  AppDelegate.swift
//  httpConnectTest
//
//  Created by Shusuke Unno on 2016/09/10.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        window!.rootViewController = viewController
        window!.makeKeyAndVisible()

        return true
    }
}

