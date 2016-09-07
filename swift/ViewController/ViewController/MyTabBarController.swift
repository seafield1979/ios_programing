//
//  MyTabBarController.swift
//  ViewController
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 B02681. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    var firstView: Tab1ViewController!
    var secondView: Tab2ViewController!
    
    @IBOutlet var tabBarView: UIView!
    
    @IBAction func tabButtonTapped(button : UIButton) {
        switch button.tag {
        case 1:
            print("button1")
        case 2:
            print("button2")
        case 3:
            print("button3")
        case 4:
            print("button4")
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        firstView = Tab1ViewController()
        secondView = Tab2ViewController()
        
        //表示するtabItemを指定（今回はデフォルトのItemを使用）
//        firstView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 1)
//        secondView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 2)
        
        // アイコン画像を設定
//        firstView.tabBarItem = UITabBarItem(title: "contact", image: UIImage(named:"image/Contacts-50.png"), selectedImage: UIImage(named:"image/Contacts-50.png"))
//        secondView.tabBarItem = UITabBarItem(title: "bowing", image: UIImage(named:"image/Bowing Man-50.png"), selectedImage: UIImage(named:"image/Bowing Man-50.png"))
        
        tabBar.backgroundColor = .grayColor()
                
        // タブで表示するViewControllerを配列に格納する
        let myTabs = [firstView!, secondView!]
        
        // 配列をTabにセット
        self.setViewControllers(myTabs, animated: false)
        
        let view1 = UINib(nibName: "MyTabBarController", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UIView
        
//        NSBundle.mainBundle().loadNibNamed("MyTabBarController", owner: self, options: nil)
        
        
                let view2 = UIView(frame: CGRectMake(0,0,320,40))
                view2.backgroundColor = .yellowColor()
                self.tabBar.addSubview(view2)

        self.tabBar.addSubview(view1)
        
    }
}
