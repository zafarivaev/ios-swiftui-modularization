//
//  AuthService.swift
//  Services
//
//  Created by Zafar Ivaev on 20/08/23.
//

import Foundation

public protocol AuthServiceProtocol {
    func signIn() async throws
    func signOut() async throws
    func isSignedIn() async -> Bool
}

public final class AuthService: AuthServiceProtocol {
    
    public init() {}
    
    private let isSignedInKey = "isSignedIn"
    
    public func signIn() async throws {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        UserDefaults.standard.setValue(true, forKey: isSignedInKey)
    }
    
    public func signOut() async throws {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        UserDefaults.standard.setValue(false, forKey: isSignedInKey)
    }
    
    public func isSignedIn() async -> Bool {
        UserDefaults.standard.bool(forKey: isSignedInKey)
    }
}

