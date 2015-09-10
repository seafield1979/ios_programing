//
//  ViewController.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let app = UIApplication.sharedApplication().delegate as! AppDelegate;
        if  app.viewController2 == nil {
            app.viewController2 = ViewController2(nibName: "ViewController2", bundle: nil);
        }
        app.window?.rootViewController = app.viewController2;
    }
}

