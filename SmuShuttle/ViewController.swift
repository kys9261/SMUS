//
//  ViewController.swift
//  SMUS
//
//  Created by KimCP on 2015. 5. 24..
//  Copyright (c) 2015년 BeehiveStudio. All rights reserved.
//

import UIKit
import GoogleMobileAds
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet var bannerView: GADBannerView!
    var controller: TimeTabViewController?
    
    @IBOutlet var cheonCampus: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //Admob Init
        self.bannerView.adUnitID = "ca-app-pub-0528563211821066/1643960076"
        self.bannerView.rootViewController = self
        let request: GADRequest = GADRequest()
        self.bannerView.adSize = kGADAdSizeSmartBannerPortrait
        self.bannerView.loadRequest(request)
        
        self.cheonCampus.hidden = true
        self.title = "여름방학 시간표"
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //Google Analytics set screen
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            let screenName = "Main Page"
            let build = GAIDictionaryBuilder.createAppView().set(screenName, forKey: kGAIScreenName).build() as NSDictionary
            appDelegate.tracker!.send(build as [NSObject : AnyObject])
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func cheonanStation(sender: UIButton){
        self.performSegueWithIdentifier("location", sender: self)
        controller?.location = "caStation"
    }
    
    @IBAction func cheonanTerminal(sender: UIButton) {
        self.performSegueWithIdentifier("location", sender: self)
        controller?.location = "caTerminal"
    }
    
    @IBAction func onyangStation(sender: UIButton) {
        self.performSegueWithIdentifier("location", sender: self)
        controller?.location = "oyStation"
    }
    
    @IBAction func cheonanCampus(sender: UIButton) {
        self.performSegueWithIdentifier("location2", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "location" {
            controller = segue.destinationViewController as? TimeTabViewController
        }else if segue.identifier == "location2"{
            print("cam")
        }
    }
}

