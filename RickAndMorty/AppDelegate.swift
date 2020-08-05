//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Natália Arantes on 31/07/20.
//  Copyright © 2020 Natália Arantes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = StartViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }

}

