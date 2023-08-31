//
//  SettingsWorker.swift
//  Settings
//
//  Created by Zafar Ivaev on 19/08/23.
//  
//

import Foundation
import Services

protocol SettingsWorkerProtocol {
    func performSignOut() async throws
}

final class SettingsWorker: SettingsWorkerProtocol {
    
    // MARK: - Initialization
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    private let authService: AuthServiceProtocol

    // MARK: - Protocol Methods
    
    func performSignOut() async throws {
        try await authService.signOut()
    }
    
}
