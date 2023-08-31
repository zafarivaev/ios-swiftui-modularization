//
//  SignInViewModel.swift
//  Sign In
//
//  Created by Zafar Ivaev on 20/08/23.
//  
//

import Foundation
import Models

@MainActor
public protocol SignInNavigation: AnyObject {
    func performRoute(_ route: SignInViewModel.Route)
}

@MainActor
public final class SignInViewModel: ObservableObject {
    
    // MARK: - Routes
    
    public enum Route {
        case main
    }
    
    // MARK: - Initialization
    
    init(
        worker: SignInWorkerProtocol,
        navigation: SignInNavigation?
    ) {
        self.worker = worker
        self.navigation = navigation
    }
    
    private let worker: SignInWorkerProtocol
    private let navigation: SignInNavigation?
    
    // MARK: - Output
    
    @Published var isLoading: Bool = false
    
    // MARK: - Input
    
    func onSignInTap() {
        Task {
            isLoading = true
            do {
                try await worker.performSignIn()
                isLoading = false
                navigation?.performRoute(.main)
            } catch {
                print(error)
                isLoading = false
            }
        }
    }
    
}
