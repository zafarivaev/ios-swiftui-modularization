//
//  QuotesService.swift
//  Services
//
//  Created by Zafar Ivaev on 08/08/23.
//

import Foundation
import Endpoints
import Entities
import Networker

public protocol QuotesServiceProtocol {
    func fetchQuotes(count: Int) async throws -> [Quote]
}

public final class QuotesService: QuotesServiceProtocol {
    private let networker: NetworkerProtocol
    
    public init(networker: NetworkerProtocol) {
        self.networker = networker
    }
    
    public func fetchQuotes(count: Int) async throws -> [Quote] {
        let endpoint = Endpoint.quotes(count: count)
        return try await networker.get(type: [Quote].self, url: endpoint.url, headers: endpoint.headers)
    }
}

public final class QuotesMockService: QuotesServiceProtocol {
    
    public init() {}
    
    public func fetchQuotes(count: Int) async throws -> [Quote] {
        try await Task.sleep(nanoseconds: 2_000_000_000)
        return [
            .init(quote: "Test quote 1", character: "Test character 1", image: nil),
            .init(quote: "Test quote 2", character: "Test character 2", image: nil),
            .init(quote: "Test quote 3", character: "Test character 3", image: nil),
        ]
    }
}
