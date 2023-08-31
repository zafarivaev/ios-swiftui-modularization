//
//  SignInAssembly.swift
//  Sign In
//
//  Created by Zafar Ivaev on 20/08/23.
//  
//

import UIKit
import Services

@MainActor
public enum SignInAssembly {
    public static func assemble(
        navigation: SignInNavigation?
    ) -> SignInView {
        let authService: AuthServiceProtocol = AuthService()
        let worker: SignInWorkerProtocol = SignInWorker(authService: authService)
        let viewModel = SignInViewModel(worker: worker, navigation: navigation)
        return SignInView(viewModel: viewModel)
    }
}
