//
//  ViewController2.swift
//  ViewController
//
//  Created by B02681 on 2015/09/10.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "page " + navigationController!.viewControllers.count.description
    }
    
    /**
     * ページ1ViewControllerに遷移する
     */
    @IBAction func page1ButtonDidTap(sender: AnyObject)
    {
        let viewController = ViewController(nibName: "ViewController", bundle: nil)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
