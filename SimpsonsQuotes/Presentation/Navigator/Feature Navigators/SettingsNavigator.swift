//
//  SettingsNavigator.swift
//  Navigator
//
//  Created by Zafar Ivaev on 26/08/23.
//

import UIKit
import SwiftUI
import Settings

public final class SettingsNavigator: NavigatorProtocol, SettingsNavigation {
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private unowned let navigationController: UINavigationController
    private weak var settingsViewController: UIViewController?
    
    // MARK: - Protocol Methods
    
    public func start() {
        let settingsView = SettingsAssembly.assemble(navigation: self)
        let settingsViewController = UIHostingController(rootView: settingsView)
        self.settingsViewController = settingsViewController
        navigationController.pushViewController(settingsViewController, animated: true)
    }
    
    public func performRoute(_ route: SettingsViewModel.Route) {
        guard let window = navigationController.view.window else { return }
        switch route {
        case .signOut:
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = .fade
            transition.subtype = .fromBottom
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            let startNavigator = StartNavigator(window: window)
            startNavigator.start()
            window.layer.add(transition, forKey: kCATransition)
            
//            if let rootNavigationController = window.rootViewController?.navigationController {
//                rootNavigationController.popToRootViewController(animated: true)
//            } else {
//                window.rootViewController?.dismiss(animated: true)
//            }
        }
    }
}
