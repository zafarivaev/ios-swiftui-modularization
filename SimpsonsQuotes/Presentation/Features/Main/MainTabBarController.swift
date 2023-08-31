//
//  MainTabBarController.swift
//  Main
//
//  Created by Zafar Ivaev on 20/08/23.
//

import UIKit

@MainActor
public protocol MainNavigation: AnyObject {
    func setupRoutes(_ routes: [MainTabBarController.Route])
}

public class MainTabBarController: UITabBarController {
    
    // MARK: - Routes
    
    public enum Route {
        case quotes
        case settings
    }
    
    // MARK: - Initialization
    
    public init(navigation: MainNavigation?) {
        self.navigation = navigation
        super.init(nibName: nil, bundle: nil)
    }
    
    private let navigation: MainNavigation?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigation?.setupRoutes([.quotes, .settings])
    }
    
}
