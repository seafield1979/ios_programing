//
//  UNModalViewController.swift
//  SwiftViewController
//
//  Created by B02681 on 2015/04/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

import UIKit

class UNModalViewController: UIViewController {

    @IBAction func closeButtonDidTap(sender: AnyObject) {
        println("close")
        self.dismissViewControllerAnimated(true, completion: {
            
        })
    }
}
