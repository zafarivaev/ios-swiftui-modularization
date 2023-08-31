//
//  SettingsAssembly.swift
//  Settings
//
//  Created by Zafar Ivaev on 19/08/23.
//  
//

import UIKit
import Services

@MainActor
public enum SettingsAssembly {
    public static func assemble(
        navigation: SettingsNavigation?
    ) -> SettingsView {
        let authService: AuthServiceProtocol = AuthService()
        let worker: SettingsWorkerProtocol = SettingsWorker(authService: authService)
        let viewModel = SettingsViewModel(worker: worker, navigation: navigation)
        return SettingsView(viewModel: viewModel)
    }
}
