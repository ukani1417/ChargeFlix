//
//  ChargeFlixTabBarController.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class ChargeFlixTabBarController: UITabBarController {
    
    let homeViewController = HomeRouter.createModule()
    let movieViewController = MovieRouter.createModule()
    let tvShowViewController = TVShowRouter.createModule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTabs()
    }
    
    private func setupUI() {
        self.tabBar.tintColor = AppTheme.tabBarTintColor
        self.tabBar.unselectedItemTintColor = AppTheme.tabBarUnselectedColor
    }
    private func setupTabs() {
        let homeTabItem = UITabBarItem(title: "Home", image: UIImage(named: "house"), selectedImage: UIImage(named: "play.house.fill"))
        let movieTabItem = UITabBarItem(title: "Movie", image: UIImage(named: "movieclapper"), selectedImage: UIImage(named: "movieclapper.fill"))
        let tvShowTabItem = UITabBarItem(title: "TVShow", image: UIImage(named: "tv"), selectedImage: UIImage(named: "play.tv.fill"))
        
        homeViewController.tabBarItem = homeTabItem
        movieViewController.tabBarItem = movieTabItem
        tvShowViewController.tabBarItem = tvShowTabItem
    
        self.viewControllers = [homeViewController, movieViewController, tvShowViewController]
    }
}
