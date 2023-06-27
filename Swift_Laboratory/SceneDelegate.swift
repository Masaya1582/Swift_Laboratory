//
//  SceneDelegate.swift
//  Swift_Laboratory
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/27.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // guard let _ = (scene as? UIWindowScene) else { return }
        // 追記 -----ここから (NavigationControllerを使用する場合)
//        window = UIWindow(windowScene: scene as! UIWindowScene)
//        window?.makeKeyAndVisible()
//        let <#名前#>ViewController = <#ファイル名#>()
//        let rootViewController = UINavigationController(rootViewController: <#名前#>ViewController)
//        window?.rootViewController = rootViewController
        // 追記 -----ここまで

        // 追記 -----ここから (NavigationControllerを使用しない場合)
        window = UIWindow(windowScene: scene as! UIWindowScene)
        window?.makeKeyAndVisible()
        let homeViewController = HomeViewController()
        window?.rootViewController = homeViewController
        // 追記 -----ここまで
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}
