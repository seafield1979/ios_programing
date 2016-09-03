//
//  ViewController.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "page " + navigationController!.viewControllers.count.description
    }

    @IBAction func button1DidTap(sender: AnyObject)
    {
        view.backgroundColor = UIColor.greenColor();

    }
    
    /*
     * ViewController2を表示
     */
    @IBAction func page2ButtonDidTap(sender: AnyObject)
    {
        let viewController2 = ViewController2(nibName: "ViewController2", bundle: nil)
        self.navigationController?.pushViewController(viewController2, animated: true)
    }
    
// MARK: UIViewControllerの基本メソッド
 
    // 画面が表示される前に呼ばれる
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    // 画面が表示された後に呼ばれる
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    
    // 画面が閉じる前に呼ばれる
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    // 画面が閉じた後に呼ばれる
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }
    
    // メモリ不足時に呼ばれる
    override func didReceiveMemoryWarning() {
        
        print("didReceiveMemoryWarning")
    }
    
    // 自動回転前に呼ばれる
    override func shouldAutorotate() -> Bool {
    
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        //return UIInterfaceOrientationMask.All
        return UIInterfaceOrientationMask.Portrait
    }
}

