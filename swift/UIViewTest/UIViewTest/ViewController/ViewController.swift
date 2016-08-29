//
//  ViewController.swift
//  UIViewTest
//
//  Created by Shusuke Unno on 2016/08/27.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var view1 : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Viewを追加
        self.view1 = UIView(frame: CGRect(x:0, y:0, width:100, height:100))
        view1!.backgroundColor = UIColor.redColor()
        self.view.addSubview(view1!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
