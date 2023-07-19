//
//  SceneDelegate.swift
//  Posted
//
//  Created by Omar Leal on 15/7/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let customWindowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: customWindowScene.coordinateSpace.bounds)
        window?.windowScene = customWindowScene
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        
    }
    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

