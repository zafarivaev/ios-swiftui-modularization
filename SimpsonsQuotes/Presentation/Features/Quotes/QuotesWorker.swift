//
//  QuotesWorker.swift
//  Quotes
//
//  Created by Zafar Ivaev on 08/08/23.
//

import Foundation
import Services
import Models

protocol QuotesWorkerProtocol {
    func getQuotes() async throws -> [QuoteModel]
}

final class QuotesWorker: QuotesWorkerProtocol {
    
    // MARK: - Initialization
    
    init(quotesService: QuotesServiceProtocol) {
        self.quotesService = quotesService
    }

    private let quotesService: QuotesServiceProtocol

    // MARK: - Protocol Methods
    
    func getQuotes() async throws -> [QuoteModel] {
        try await quotesService.fetchQuotes(count: 10)
            .compactMap { QuoteModel(dto: $0) }
    }
}
