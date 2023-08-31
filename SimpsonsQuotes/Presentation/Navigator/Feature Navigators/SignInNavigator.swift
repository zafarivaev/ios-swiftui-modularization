//
//  SignInNavigator.swift
//  Navigator
//
//  Created by Zafar Ivaev on 26/08/23.
//

import UIKit
import SwiftUI
import SignIn
import Main

public final class SignInNavigator: NavigatorProtocol, SignInNavigation {
    
    public init(sourceViewController: UIViewController) {
        self.sourceViewController = sourceViewController
    }
    
    private unowned let sourceViewController: UIViewController
    private weak var signInViewController: UIViewController?
    
    // MARK: - Protocol Methods
    
    public func start() {
        let signInView = SignInAssembly.assemble(navigation: self)
        let signInViewController = UIHostingController(rootView: signInView)
        signInViewController.modalPresentationStyle = .fullScreen
        self.signInViewController = signInViewController
        sourceViewController.present(signInViewController, animated: true)
    }
    
    public func performRoute(_ route: SignInViewModel.Route) {
        guard let signInViewController = signInViewController else { return }
        switch route {
        case .main:
            let mainNavigator = MainNavigator(sourceViewController: signInViewController)
            mainNavigator.start()
        }
    }
}
