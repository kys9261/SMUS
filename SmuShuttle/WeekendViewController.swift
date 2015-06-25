//
//  WeekendViewController.swift
//  SMUS
//
//  Created by KimCP on 2015. 5. 30..
//  Copyright (c) 2015년 BeehiveStudio. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeekendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topBar: UIImageView!
    @IBOutlet weak var timeTableView: UITableView!
    
    var location: String?
    var jsons: JSON?
    var counts: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = self.tabBarController as! TimeTabViewController
        self.location = location.location
        if self.location == "caStation" {
            let nib = UINib(nibName: "CaStation", bundle:nil)
            timeTableView.registerNib(nib, forCellReuseIdentifier: "customCell")
            self.timeTableView.contentInset = UIEdgeInsetsMake(-2.0, 0.0, 0.0, 0.0)
            self.topBar.image = UIImage(named: "cs_top")
            //let path = NSBundle.mainBundle().pathForResource("cheonWeekend", ofType: "json")
            let path = NSBundle.mainBundle().pathForResource("weekendCa_sv", ofType: "json")
            let data = NSData(contentsOfFile: path!)
            jsons = JSON(data: data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
            counts = jsons?.count
        }else if self.location == "caTerminal" {
            let nib = UINib(nibName: "CaTerminal", bundle:nil)
            timeTableView.registerNib(nib, forCellReuseIdentifier: "customCell")
            self.timeTableView.contentInset = UIEdgeInsetsMake(-2.0, 0.0, 0.0, 0.0)
            self.topBar.image = UIImage(named: "ct_top")
            //let path = NSBundle.mainBundle().pathForResource("terminalWeekend", ofType: "json")
            let path = NSBundle.mainBundle().pathForResource("weekendTe_sv", ofType: "json")

            let data = NSData(contentsOfFile: path!)
            jsons = JSON(data: data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
            counts = jsons?.count
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.location == "caStation" || self.location == "caTerminal" {
            return self.counts!
        }else{
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell1: UITableViewCell?
        
        if self.location == "caStation"{
            let cell: CaStationViewCell = self.timeTableView.dequeueReusableCellWithIdentifier("customCell") as! CaStationViewCell
        
            var tmp = jsons?.array?[indexPath.row]
            cell.label4.hidden = true
            cell.label1.text = tmp!["선문대출발"].stringValue
            cell.label2.text = tmp!["아산Ktx역"].stringValue
            cell.label3.text = tmp!["천안역"].stringValue
            cell.label5.text = tmp!["아산Ktx역 2"].stringValue
            cell.label6.text = tmp!["선문대도착"].stringValue
            cell1 = cell
        }else if self.location == "caTerminal" {
            let cell: CaTerminalViewCell = self.timeTableView.dequeueReusableCellWithIdentifier("customCell") as! CaTerminalViewCell
            var tmp = jsons?.array?[indexPath.row]
            cell.label1.text = tmp!["선문대출발"].stringValue
            cell.label2.text = tmp!["터미널"].stringValue
            cell.label3.hidden = true
            cell.label4.text = tmp!["선문대도착"].stringValue
            cell1 = cell
        }
        return cell1!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row \(indexPath.row) selected")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
    
}