//
//  QuoteDetailViewModel.swift
//  QuoteDetail
//
//  Created by Zafar Ivaev on 10/08/23.
//

import Combine
import Models

@MainActor
public protocol QuoteDetailNavigation: AnyObject {
    func performRoute(_ route: QuoteDetailViewModel.Route)
    func didDeleteQuote(_ quote: QuoteModel)
}

@MainActor
public final class QuoteDetailViewModel: ObservableObject {
    
    // MARK: - Routes
    
    public enum Route {
        case quotes
    }
    
    // MARK: - Initialization
    
    init(
        navigation: QuoteDetailNavigation?, 
        quote: QuoteModel
    ) {
        self.navigation = navigation
        self.quote = quote
    }
    
    private let navigation: QuoteDetailNavigation?
    
    // MARK: - Output
    
    public let quote: QuoteModel
    
    // MARK: - Input
    
    func onDeleteTap() {
        navigation?.didDeleteQuote(quote)
        navigation?.performRoute(.quotes)
    }
    
}
