//
//  ___FILENAME___
//  ___PRODUCTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

@MainActor
public protocol ___VARIABLE_ModuleName___Navigation: AnyObject {
    func performRoute(_ route: ___VARIABLE_ModuleName___ViewModel.Route)
}

@MainActor
public final class ___VARIABLE_ModuleName___ViewModel: ObservableObject {
    
    // MARK: - Routes
    
    public enum Route {}
    
    // MARK: - Initialization
    
    init(
        worker: ___VARIABLE_ModuleName___WorkerProtocol,
        navigation: ___VARIABLE_ModuleName___Navigation?
    ) {
        self.worker = worker
        self.navigation = navigation
    }
    
    private let worker: ___VARIABLE_ModuleName___WorkerProtocol
    private let navigation: ___VARIABLE_ModuleName___Navigation?
    
    // MARK: - Output
    
    
    // MARK: - Input
    
}
