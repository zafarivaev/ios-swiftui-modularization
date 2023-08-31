//
//  StartAssembly.swift
//  Start
//
//  Created by Zafar Ivaev on 20/08/23.
//  
//

import UIKit
import Services

@MainActor
public enum StartAssembly {
    public static func assemble(
        navigation: StartNavigation?
    ) -> StartView {
        let authService: AuthServiceProtocol = AuthService()
        let worker: StartWorkerProtocol = StartWorker(authService: authService)
        let viewModel = StartViewModel(worker: worker, navigation: navigation)
        return StartView(viewModel: viewModel)
    }
}
