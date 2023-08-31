//
//  QuotesViewModel.swift
//  Quotes
//
//  Created by Zafar Ivaev on 08/08/23.
//

import Combine
import Models

@MainActor
public protocol QuotesNavigation: AnyObject {
    func performRoute(_ route: QuotesViewModel.Route)
}

@MainActor
public final class QuotesViewModel: ObservableObject {
    
    // MARK: - Routes
    
    public enum Route {
        case quoteDetail(QuoteModel)
    }
    
    // MARK: - Initialization
    
    init(worker: QuotesWorkerProtocol, navigation: QuotesNavigation?) {
        self.worker = worker
        self.navigation = navigation
        
        bindQuoteDeletion()
    }
    
    private let worker: QuotesWorkerProtocol
    private let navigation: QuotesNavigation?
    
    // MARK: - Binding
    
    private var cancellables = Set<AnyCancellable>()
    public let onQuoteDeleteSubject = PassthroughSubject<QuoteModel, Never>()
    
    private func bindQuoteDeletion() {
        onQuoteDeleteSubject
            .sink { [weak self] quoteToBeDeleted in
                self?.quotes.removeAll { $0.id == quoteToBeDeleted.id }
            }
            
            .store(in: &cancellables)
    }
    
    // MARK: - Output
    
    @Published var quotes: [QuoteModel] = []
    @Published var isListLoading = true
    
    // MARK: - Input
    
    func viewAppeared() {
        Task {
            do {
                self.quotes = try await worker.getQuotes()
                self.isListLoading = false
            } catch {
                self.isListLoading = false
                print(error)
            }
        }
    }
    
    func quoteTapped(_ quote: QuoteModel) {
        navigation?.performRoute(.quoteDetail(quote))
    }
    
}
