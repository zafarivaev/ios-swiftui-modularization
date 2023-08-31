//
//  StartViewModel.swift
//  Start
//
//  Created by Zafar Ivaev on 20/08/23.
//  
//

import Foundation

@MainActor
public protocol StartNavigation: AnyObject {
    func performRoute(_ route: StartViewModel.Route)
}

@MainActor
public final class StartViewModel: ObservableObject {
    
    // MARK: - Routes
    
    public enum Route {
        case signIn
        case main
    }
    
    // MARK: - Initialization
    
    init(
        worker: StartWorkerProtocol,
        navigation: StartNavigation?
    ) {
        self.worker = worker
        self.navigation = navigation
    }
    
    private let worker: StartWorkerProtocol
    private let navigation: StartNavigation?
    
    // MARK: - Output
    
    
    // MARK: - Input
    
    func onViewAppear() {
        Task {
            let isAuthenticated = await worker.isAuthenticated()
            navigation?.performRoute(isAuthenticated ? .main : .signIn)
        }
    }
    
}
