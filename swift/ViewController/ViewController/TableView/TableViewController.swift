//
//  TableViewController.swift
//  ViewController
//
//  Created by Shusuke Unno on 2016/09/03.
//  Copyright © 2016年 B02681. All rights reserved.
//
// UITableViewController
// UITableViewCell
// のサンプル

import UIKit

class TableViewController: UITableViewController {
    
    var tableData1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for index in 1...30 {
            tableData1.append("hoge\(index)")
        }
        
        // ステータスバーの上にUITableViewが表示されないように位置をずらす
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        self.tableView.contentInset.top = statusBarHeight
        
        // セル用のxibを登録する
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "cell1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    // セクション数を返す
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // Row数を返す
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData1.count
    }

    // Rowの高さを返す
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 80
    }
    
    // セルを返す(xibから生成した自前のセル)
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let mode = 2
        
        switch mode {
        case 1: // 自前のxibから生成したセルを返す
            let cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as! MyTableViewCell
            
            cell.label1.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
            return cell
    
        case 2:  // UITableViewCellで生成したセルを返す
            fallthrough
        default:
            let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
            cell.textLabel!.text = "hoge selction:\(indexPath.section) : row:\(indexPath.row)"
            cell.detailTextLabel!.text = "detail"
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .grayColor()
            }
            return cell
        }
    }
}
