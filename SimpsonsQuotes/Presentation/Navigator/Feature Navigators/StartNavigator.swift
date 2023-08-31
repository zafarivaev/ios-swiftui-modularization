//
//  StartNavigator.swift
//  Navigator
//
//  Created by Zafar Ivaev on 26/08/23.
//

import UIKit
import SwiftUI
import Start
import Main
import SignIn

public final class StartNavigator: NavigatorProtocol, StartNavigation {
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    private unowned let window: UIWindow
    private weak var startViewController: UIViewController?
    
    // MARK: - Protocol Methods
    
    public func start() {
        let startView = StartAssembly.assemble(navigation: self)
        let startViewController = UIHostingController(rootView: startView)
        window.rootViewController = startViewController
        self.startViewController = startViewController
        window.makeKeyAndVisible()
    }
    
    public func performRoute(_ route: StartViewModel.Route) {
        guard let startViewController = startViewController else { return }
        
        switch route {
        case .signIn:
            let signInNavigator = SignInNavigator(sourceViewController: startViewController)
            signInNavigator.start()
        case .main:
            let mainNavigator = MainNavigator(sourceViewController: startViewController)
            mainNavigator.start()
        }
    }
}
