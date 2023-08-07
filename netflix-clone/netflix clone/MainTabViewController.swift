//
//  ViewController.swift
//  netflix clone
//
//  Created by Saurabh Dalakoti on 06/08/23.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemYellow
    
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let upComingViewController = UINavigationController(rootViewController: UpcomingViewController())
        let downloadViewController = UINavigationController(rootViewController: DownloadsViewController())
        
//        set image for bottom items
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        upComingViewController.tabBarItem.image = UIImage(systemName: "play.circle")
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
//        set title as well
        homeViewController.title = "Home"
        searchViewController.title = "Search"
        upComingViewController.title = "Coming Soon"
        downloadViewController.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([
            homeViewController,
            searchViewController,
            upComingViewController,
            downloadViewController
        ], animated: true)
        
    }

}

