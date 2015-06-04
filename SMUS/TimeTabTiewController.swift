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
        if self.location == "oyStation" || self.location == "caCampus" {
            dataTab.hidden = true
        }
    }
}