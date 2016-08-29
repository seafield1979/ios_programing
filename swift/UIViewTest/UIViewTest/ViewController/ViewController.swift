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
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    @IBAction func button1Taped(sender: AnyObject) {
        moveView(self.view1)
    }
    
    @IBAction func button2Taped(sender: AnyObject) {
        changeSizeView(self.view1)
    }
    
    @IBAction func button3Taped(sender: AnyObject) {
        showToggle(self.view1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Viewを追加
        self.view1 = UIView(frame: CGRect(x:0, y:20, width:100, height:100))
        view1!.backgroundColor = UIColor.redColor()
        self.view.addSubview(view1!)
    }
    
    func moveView(view : UIView?) {
        let frame = view?.frame
 
        view1?.frame = CGRectMake(frame!.origin.x + 50.0,
                              frame!.origin.y,
                              frame!.size.width,
                              frame!.size.height)
    }
    
    func changeSizeView(view : UIView?) {
        let frame = view?.frame
        view1?.frame = CGRectMake(frame!.origin.x,
                                    frame!.origin.y,
                                    frame!.size.width,
                                    frame!.size.height + 50.0)
    }
    func showToggle(view : UIView?) {
        if view!.hidden {
            view!.hidden = false
            button3.setTitle("show", forState:UIControlState.Normal)
        }
        else {
            view!.hidden = true
            button3.setTitle("hide", forState:UIControlState.Normal)
        }
    }
}
