//
//  SettingsViewModel.swift
//  Settings
//
//  Created by Zafar Ivaev on 19/08/23.
//  
//

import Foundation
import Models

@MainActor
public protocol SettingsNavigation: AnyObject {
    func performRoute(_ route: SettingsViewModel.Route)
}

@MainActor
public final class SettingsViewModel: ObservableObject {
    
    // MARK: - Routes
    
    public enum Route {
        case signOut
    }
    
    // MARK: - Initialization
    
    init(
        worker: SettingsWorkerProtocol,
        navigation: SettingsNavigation?
    ) {
        self.worker = worker
        self.navigation = navigation
    }
    
    private let worker: SettingsWorkerProtocol
    private let navigation: SettingsNavigation?
    
    // MARK: - Output
    
    @Published var isLoading: Bool = false
    
    // MARK: - Input
    
    func onSignOutTapped() {
        Task {
            isLoading = true
            do {
                try await worker.performSignOut()
                isLoading = false
                navigation?.performRoute(.signOut)
            } catch {
                print(error)
                isLoading = false
            }
        }
    }
    
}
