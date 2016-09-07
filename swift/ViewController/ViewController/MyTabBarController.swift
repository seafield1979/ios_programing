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
    //@IBOutlet var tabBarButtons : [UIButton]!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var tabBarButtons: [UIButton]!
    @IBOutlet var tabBarView: UIView!
    
    @IBAction func tabButtonTapped(button : UIButton) {
        switch button.tag {
        case 1:
            self.selectedIndex = 0
        case 2:
            print("button2")
            self.selectedIndex = 1
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

        // TabBarにボタンを追加する
        // ※xibを使う方法はうまくいかないので諦めた。
        createTabBarView()
    }
    
    func createTabBarView() {
        // bg
        let bgView = UIView(frame: CGRectMake(0,0,tabBar.frame.size.width, tabBar.frame.size.height))
        bgView.backgroundColor = .blackColor()
        self.tabBar.addSubview(bgView)
        
        // buttons
        let width = tabBar.frame.size.width / 4
        
        for index in 0...3 {
            let button = UIButton(frame: CGRectMake(width * CGFloat(index), 0, width, 49))
            button.setTitle("button\(index)", forState: .Normal)
            button.setTitleColor(.blackColor(), forState: .Highlighted)
            button.addTarget(self, action: #selector(self.tabButtonTapped(_:)), forControlEvents: .TouchUpInside)
            button.tag = index + 1
            self.tabBar.addSubview(button)
        }
    }
    
    func addView1(){
        let _view = UIView()
        _view.frame = CGRectMake(0,0,100,100)
        _view.backgroundColor = .blackColor()
        self.tabBar.addSubview(_view)
    }
}


