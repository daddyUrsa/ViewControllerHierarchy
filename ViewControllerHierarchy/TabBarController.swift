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
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

        let secondViewController = ViewController2()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)

        let tabBarList = [firstViewController, secondViewController]

        viewControllers = tabBarList
    }

}
