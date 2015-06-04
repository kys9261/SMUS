//
//  NormalViewController.swift
//  SMUS
//
//  Created by KimCP on 2015. 5. 24..
//  Copyright (c) 2015년 BeehiveStudio. All rights reserved.
//

import UIKit
import SwiftyJSON

class NormalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
            var nib = UINib(nibName: "CaStation", bundle:nil)
            timeTableView.registerNib(nib, forCellReuseIdentifier: "customCell")
            self.timeTableView.contentInset = UIEdgeInsetsMake(-3.0, 0.0, 0.0, 0.0)
            
            self.topBar.image = UIImage(named: "cs_top")
            
            let path = NSBundle.mainBundle().pathForResource("cheonNormal", ofType: "json")
            let data = NSData(contentsOfMappedFile: path!)
            jsons = JSON(data: data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
            counts = jsons?.count
        }else if self.location == "caTerminal" {
            var nib = UINib(nibName: "CaTerminal", bundle:nil)
            timeTableView.registerNib(nib, forCellReuseIdentifier: "customCell")
            self.timeTableView.contentInset = UIEdgeInsetsMake(-3.0, 0.0, 0.0, 0.0)
        
            self.topBar.image = UIImage(named: "ct_top")
            
            let path = NSBundle.mainBundle().pathForResource("terminalNormal", ofType: "json")
            let data = NSData(contentsOfMappedFile: path!)
            jsons = JSON(data: data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
            counts = jsons?.count

        }else if self.location == "oyStation" {
            var nib = UINib(nibName: "OyStation", bundle:nil)
            timeTableView.registerNib(nib, forCellReuseIdentifier: "customCell")
            self.timeTableView.contentInset = UIEdgeInsetsMake(-3.0, 0.0, 0.0, 0.0)
            
            self.topBar.image = UIImage(named: "oy_top")
            
            let path = NSBundle.mainBundle().pathForResource("onyang", ofType: "json")
            let data = NSData(contentsOfMappedFile: path!)
            jsons = JSON(data: data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
            counts = jsons?.count
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.location == "caStation" || self.location == "oyStation" || self.location == "caTerminal" {
            return self.counts!
        }else{
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell1: UITableViewCell?
        
        if self.location == "caStation"{
            var cell: CaStationViewCell = self.timeTableView.dequeueReusableCellWithIdentifier("customCell") as! CaStationViewCell

            var tmp = jsons?.array?[indexPath.row]
            cell.label1.text = tmp!["아산캠퍼스출발"].stringValue
            cell.label2.text = tmp!["아산역Ktx"].stringValue
            
            if indexPath.row == 31{
                println(tmp!)
            }
            
            if (tmp!["천안역"].stringValue.rangeOfString("금X") != nil) {
                cell.label3.font = UIFont(name: cell.label3.font.fontName, size: 9.5)
            }else{
                cell.label3.font = UIFont(name: cell.label3.font.fontName, size: 15)
            }
            cell.label3.text = tmp!["천안역"].stringValue
            
            cell.label4.text = tmp!["용암마을"].stringValue
            
            if (tmp!["아산역Ktx 2"].stringValue.rangeOfString("금X") != nil) {
                cell.label5.font = UIFont(name: cell.label5.font.fontName, size: 9.5)
            }else{
                cell.label5.font = UIFont(name: cell.label5.font.fontName, size: 15)
            }
            cell.label5.text = tmp!["아산역Ktx 2"].stringValue
            
            if (tmp!["아산캠퍼스도착"].stringValue.rangeOfString("금X") != nil) {
                cell.label6.font = UIFont(name: cell.label6.font.fontName, size: 9.5)
            }else{
                cell.label6.font = UIFont(name: cell.label6.font.fontName, size: 15)
            }
            cell.label6.text = tmp!["아산캠퍼스도착"].stringValue
            cell1 = cell
        }else if self.location == "caTerminal" {
            var cell: CaTerminalViewCell = self.timeTableView.dequeueReusableCellWithIdentifier("customCell") as! CaTerminalViewCell
            var tmp = jsons?.array?[indexPath.row]
            cell.label1.text = tmp!["아산캠퍼스출발"].stringValue
            cell.label2.text = tmp!["터미널"].stringValue
            cell.label3.text = tmp!["한국전력"].stringValue
            cell.label4.text = tmp!["아산캠퍼스도착"].stringValue
            cell1 = cell
        }else if self.location == "oyStation" {
            var cell: OyStationViewCell = self.timeTableView.dequeueReusableCellWithIdentifier("customCell") as! OyStationViewCell
            var tmp = jsons?.array?[indexPath.row]
            cell.label1.text = tmp!["아산캠퍼스출발"].stringValue
            cell.label2.text = tmp!["배방지역"].stringValue
            cell.label3.text = tmp!["터미널"].stringValue
            cell.label4.text = tmp!["온양역"].stringValue
            cell.label5.text = tmp!["아산캠퍼스도착"].stringValue
            cell1 = cell
        }
        return cell1!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Row \(indexPath.row) selected")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }

}