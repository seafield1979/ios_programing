//
//  AppDelegate.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
// シンプルなUIViewControllerのサンプル

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController1: ViewController?
    var viewController2: ViewController2?
    var navigationController : NavigationController1?
    var tableViewController : TableViewController?
    
    enum Mode {
        case ViewController
        case NavigationController
        case TableView
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let mode = Mode.TableView

        window = UIWindow(frame:UIScreen.mainScreen().bounds);

        switch mode {
        case .ViewController:
            viewController1 = ViewController(nibName: "ViewController", bundle: nil)
            window!.rootViewController = viewController1;
            
        case .NavigationController:
            viewController1 = ViewController(nibName: "ViewController", bundle: nil)
            
            navigationController = NavigationController1(rootViewController: viewController1!)
            
            navigationController?.setNavigationBarHidden(false, animated: true)
            
            window!.rootViewController = navigationController;
            
        case .TableView:
            tableViewController = TableViewController(nibName: "TableViewController", bundle: nil)
            
            window!.rootViewController = tableViewController;
        }

        
        
        window?.makeKeyAndVisible();
        return true
    }
}

