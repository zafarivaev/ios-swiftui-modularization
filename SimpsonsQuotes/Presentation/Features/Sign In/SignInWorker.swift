//
//  SignInWorker.swift
//  Sign In
//
//  Created by Zafar Ivaev on 20/08/23.
//  
//

import Foundation
import Services

protocol SignInWorkerProtocol {
    func performSignIn() async throws
}

final class SignInWorker: SignInWorkerProtocol {
    
    // MARK: - Initialization
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    private let authService: AuthServiceProtocol

    // MARK: - Protocol Methods
    
    func performSignIn() async throws {
        try await authService.signIn()
    }
}
