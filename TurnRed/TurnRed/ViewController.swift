//
//  ViewController.swift
//  TurnRed
//
//  Created by Yuxing Hu on 2018/7/18.
//  Copyright © 2018 Yuxing Hu. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func makeViewRed() {
        view.backgroundColor = .red
    }
    
    public func makeViewWhite() {
        view.backgroundColor = .white
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        let activity = NSUserActivity(activityType: "com.microsoft.axp-ios.AXPlatformTest.makered")
        activity.title = "Make View Red"
        activity.userInfo = ["color" : "red"]
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
               activity.persistentIdentifier = NSUserActivityPersistentIdentifier(rawValue: "com.microsoft.axp-ios.AXPlatformTest.makered")
        view.userActivity = activity
        activity.becomeCurrent()
        makeViewRed()
    }
    
    @IBAction func buttonReturn(sender: UIButton) {
        let activity = NSUserActivity(activityType: "com.microsoft.axp-ios.AXPlatformTest.makeback")
        activity.title = "Back to White"
        activity.userInfo = ["color" : "white"]
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier(rawValue: "com.microsoft.axp-ios.AXPlatformTest.makeback")
        view.userActivity = activity
        activity.becomeCurrent()
        makeViewWhite()
    }
    
    
}

