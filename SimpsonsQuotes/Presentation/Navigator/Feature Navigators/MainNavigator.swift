//
//  MainNavigator.swift
//  Navigator
//
//  Created by Zafar Ivaev on 26/08/23.
//

import UIKit
import SwiftUI
import Main
import Quotes
import Settings

/// Navigator for the Tab Bar
public final class MainNavigator: NavigatorProtocol, MainNavigation {
    
    public init(sourceViewController: UIViewController) {
        self.sourceViewController = sourceViewController
    }
    
    private unowned let sourceViewController: UIViewController
    private weak var tabBarController: UITabBarController?
    
    // MARK: - Protocol Methods
    
    public func start() {
        let tabBarController = MainAssembly.assemble(navigation: self)
        tabBarController.modalPresentationStyle = .fullScreen
        self.tabBarController = tabBarController
        sourceViewController.present(tabBarController, animated: true)
    }
    
    public func setupRoutes(_ routes: [MainTabBarController.Route]) {
        var viewControllers: [UIViewController] = []
        routes.forEach { route in
            switch route {
            case .quotes:
                let quotesNavigationController = UINavigationController()
                quotesNavigationController.tabBarItem = UITabBarItem(title: "Quotes", image: UIImage(systemName: "text.quote"), tag: 0)
                let quotesNavigator = QuotesNavigator(navigationController: quotesNavigationController)
                viewControllers.append(quotesNavigationController)
                quotesNavigator.start()
            case .settings:
                let settingsNavigationController = UINavigationController()
                settingsNavigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
                let settingsNavigator = SettingsNavigator(navigationController: settingsNavigationController)
                viewControllers.append(settingsNavigationController)
                settingsNavigator.start()
            }
        }
        tabBarController?.viewControllers = viewControllers
    }
}
