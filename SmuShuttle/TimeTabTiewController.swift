//
//  TimeTabTiewController.swift
//  SMUS
//
//  Created by KimCP on 2015. 5. 24..
//  Copyright (c) 2015년 BeehiveStudio. All rights reserved.
//

import Foundation
import UIKit

class TimeTabViewController: UITabBarController{
    
    var location: String?
    
    @IBOutlet weak var dataTab: UITabBar!
    
    
    override func viewDidLoad() {
        
        //방학때는 평일과 주말만 운영(2개의 탭만)
        var item1 : UITabBarItem = self.dataTab.items![1] as! UITabBarItem
        item1.enabled = false

        //주말 타이틀 변경
        var item2 : UITabBarItem = self.dataTab.items![2] as! UITabBarItem
        item2.title = "주말"

        
        //온양과 천안캠은 탭바 필요없음.
        if self.location == "oyStation" || self.location == "caCampus" {
            dataTab.hidden = true
        }
    }
}