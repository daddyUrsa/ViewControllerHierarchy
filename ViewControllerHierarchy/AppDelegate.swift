//
//  AppDelegate.swift
//  ViewControllerHierarchy
//
//  Created by Alexey Golovin on 20.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let tabBarController = UITabBarController()

        let viewController1 = ViewController1()
        let viewController2 = ViewController2()
        let mainNavgationController = MainNavigationController()

        mainNavgationController.viewControllers = [viewController1]

        mainNavgationController.tabBarItem = UITabBarItem(title: "ViewController1", image: UIImage(named: "icon1"), tag: 0)
        viewController2.tabBarItem = UITabBarItem(title: "ViewController2", image: UIImage(named: "icon2"), tag: 0)

        tabBarController.viewControllers = [mainNavgationController, viewController2]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

}

