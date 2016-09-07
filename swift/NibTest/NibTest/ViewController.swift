//
//  ViewController.swift
//  NibTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(sender: AnyObject) {
        print("hello mate")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadTemplate()
    }
    
    func loadTemplate(){
        let myView = UINib(nibName: "MyView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UIView
        self.view.addSubview(myView)
    }
}

