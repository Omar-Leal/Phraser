//
//  ViewController.swift
//  Posted
//
//  Created by Omar Leal on 15/7/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor  = .black
        
        let homeVC =           UINavigationController(rootViewController: HomeViewController())
        let searchVC =         UINavigationController(rootViewController: SearchViewController())
        let notificationVC =   UINavigationController(rootViewController: NotificationViewController())
        let directMessagesVC = UINavigationController(rootViewController: DirectViewController())
        
        
        
        homeVC.tabBarItem.image =                   UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage =           UIImage(systemName: "house.fill")
        
        searchVC.tabBarItem.image =                 UIImage(systemName: "magnifyingglass.circle")
        searchVC.tabBarItem.selectedImage =         UIImage(systemName: "magnifyingglass.circle.fill")
        
        notificationVC.tabBarItem.image =           UIImage(systemName: "bell")
        notificationVC.tabBarItem.selectedImage =   UIImage(systemName: "bell.fill")
        
        directMessagesVC.tabBarItem.image =         UIImage(systemName: "envelope")
        directMessagesVC.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        let getAllVC = [ homeVC, searchVC, notificationVC, directMessagesVC ]
        
        
        setViewControllers(getAllVC, animated: true)
        
        
        
    }


}

