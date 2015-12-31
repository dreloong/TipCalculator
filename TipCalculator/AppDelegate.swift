//
//  AppDelegate.swift
//  TipCalculator
//
//  Created by Xiaofei Long on 12/26/15.
//  Copyright (c) 2015 Xiaofei Long. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    override init() {
        super.init()

        NSUserDefaults.standardUserDefaults().registerDefaults([
            "default_tip_percentage": Config.TipPercentage.initValue,
            "default_tip_percentage_updated": false,
            "theme_color_name": Config.ThemeColor.initOptionKey
        ])
    }

    func application(application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

}
