//
//  TabBarControllerViewController.swift
//  ViewControllerHierarchy
//
//  Created by Alexey Golovin on 20.06.2020.
//  Copyright © 2020 Alexey Pavlov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = ViewController1()
        firstViewController.tabBarItem = UITabBarItem(title: "ViewController1", image: UIImage(named: "icon1"), tag: 0)

        let secondViewController = ViewController2()
        secondViewController.tabBarItem = UITabBarItem(title: "ViewController2", image: UIImage(named: "icon2"), tag: 1)

        let tabBarList = [firstViewController, secondViewController]

        viewControllers = tabBarList
    }
}
