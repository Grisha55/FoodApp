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
        UITabBar.appearance().tintColor = UIColor.init(red: 18/255, green: 51/255, blue: 24/255, alpha: 0)
        self.viewControllers = [searchVC, savedVC]
        tabBar.backgroundColor = UIColor.init(red: 18/255, green: 51/255, blue: 24/255, alpha: 0)
        tabBar.barTintColor = UIColor(cgColor: CGColor(red: 18/255, green: 51/255, blue: 24/255, alpha: 0))
        tabBar.tintColor = .green
    }
    
}
