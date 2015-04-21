//
//  UNPushViewController.swift
//  SwiftViewController
//
//  Created by B02681 on 2015/04/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import UIKit

class UNPushViewController: UIViewController {

    
    
    @IBAction func popButtonDidTap(sender: AnyObject) {
        println("pop")
        navigationController?.popViewControllerAnimated(true)
    }
}
