//
//  SceneDelegate.swift
//  SimpsonsQuotes
//
//  Created by Zafar Ivaev on 09/08/23.
//

import UIKit
import Navigator

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigator: NavigatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let navigator = StartNavigator(window: window)
        self.navigator = navigator
        self.window = window
        navigator.start()
    }
}
