//
//  TabBarVC.swift
//  FoodAppList
//
//  Created by Григорий Виняр on 27.06.2021.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    private func configureTabBar() {
        UITabBar.appearance().tintColor = .systemGreen
        let searchVC = UINavigationController(rootViewController: SearchVC())
        let savedVC = UINavigationController(rootViewController: SavedVC())
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        savedVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        UITabBar.appearance().tintColor = .green
        self.viewControllers = [searchVC, savedVC]
    }
    
}
