//
//  ViewController2.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * ページ1ViewControllerに遷移する
     */
    @IBAction func page1ButtonDidTap(sender: AnyObject) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate;
        if  app.viewController1 == nil  {
            app.viewController1 = ViewController(nibName: "ViewController", bundle: nil);
        }
        app.window?.rootViewController = app.viewController1;

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
