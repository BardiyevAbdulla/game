//
//  AppDelegate.swift
//  Game
//
//  Created by admin on 10/3/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: TapBarViewController())
        return true
    }

}

